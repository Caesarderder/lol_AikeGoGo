using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using System;
using UnityEngine.EventSystems;
using static UnityEditor.Progress;
using TMPro;

public class GameRuneWidget :MonoBehaviour 
{
    EWorldType _worldType;
    [SerializeField]
    Button btn_close;
    Button[] slotBtns;
    Slot[] slots;
    int CurSelectedSlotIndex;
    Slot CurSelectedSlot = null;
    Slot CurEmptySlot = null;
    private bool isGameSuccess = false;
    public TMP_InputField runeDesc;
    bool _canInput;

    public void Init(EWorldType type)
    {
        _worldType = type;
        btn_close.onClick.AddListener(Close);

        Close();
    }
    public void Open()
    {
        slots=GetComponentsInChildren<Slot>();
        gameObject.SetActive(true);

        EventAggregator.Publish(new ChangeGameStateEvent() { 
            WorldType = _worldType,
            GameMode=EGameMode.RunePanel
        });

        Manager<InputManager>.Inst.InputButtonBinding(InputManager.ESC,
            x => {
                if ( x )
                    Close();
            });

        GetEmptySlot();
        CurSelectedSlot = CurEmptySlot;
        _canChange = true;
        _canInput = true;
    }
    public void Close()
    {
        gameObject.SetActive(false);

        EventAggregator.Publish(new ChangeGameStateEvent() { 
            WorldType = _worldType,
            GameMode=EGameMode.Normal
        });
    }
    void Start()
    {
        GetEmptySlot();
        slotBtns = GetSlotButtons();
        for (int i = 0; i < slotBtns.Length; i++)
        {
            if (slotBtns[i] != null)
            {
                int index = i;
                slotBtns[i].onClick.AddListener(() =>
                {
                    OnSlotButtonClick(index);
                });
            }
        }

        runeDesc.onEndEdit.AddListener(SaveRuneDesc);
        runeDesc.onSelect.AddListener(x => _canInput = false);
    }
    void Update()
    {
        if(_worldType == EWorldType.A && _canInput)
        {
            if (Input.GetKeyDown(KeyCode.A))
            {
                //Debug.Log ("<color=green>��ʱ���л�����</color>");
                MoveAntiClockwise();
            }
            if (Input.GetKeyDown(KeyCode.D))
            {
                //Debug.Log("<color=green>˳ʱ���л�����</color>");
                MoveClockwise();
            }
            if (Input.GetKeyDown(KeyCode.E))
            {
                //Debug.Log("<color=green>��������</color>");
                ChangeRune();
            }

        }
        IsAllMatch();
    }
    public void MoveClockwise()
    {
        ChangeSelectedIndex(CurSelectedSlotIndex+ 1);
    }
    public void MoveAntiClockwise()
    {
        ChangeSelectedIndex(CurSelectedSlotIndex-1);
    }

    public void ChangeSelectedIndex(int count)
    {
        if(_worldType==EWorldType.A)
        {
            if (CurEmptySlot != null && CurEmptySlot.adjacentSlots != null && CurEmptySlot.adjacentSlots.Count > 0 && _canChange)
            {
                CurSelectedSlotIndex = count;
                var maxIndex = CurEmptySlot.adjacentSlots.Count - 1;
                if (CurSelectedSlotIndex < 0)
                {
                    CurSelectedSlotIndex = maxIndex;

                }
                else if (CurSelectedSlotIndex > maxIndex)
                {
                    CurSelectedSlotIndex = 0;
                }

                CurSelectedSlot.transform.DOScale(1f, 0.3f);
                CurSelectedSlot = CurEmptySlot.adjacentSlots[CurSelectedSlotIndex];
                CurSelectedSlot.transform.DOScale(1.3f, 0.3f);
                //Debug.Log("<color=red>�����slot </color>" + CurEmptySlot.slotID + "<color=red>�������ĵ�slotΪ: </color>" + CurSelectedSlot.slotID);

                runeDesc.text = DataModule.Resolve<GameStatusDM>().GetRuneDesc(CurSelectedSlot.curRune.runeID);
            }
            else
            {
                Debug.LogError("<color=red>�޿ɽ����ķ���</color>");
            }
        }
        else
        {

        }

    }

    bool _canChange;
    public void ChangeRune()
    {
        if (CurSelectedSlot != null && CurEmptySlot != null&&_canChange)
        {
            if (CurSelectedSlot.curRune != null && CurEmptySlot.curRune != null)
            {
                Transform pos_start = CurSelectedSlot.curRune.transform;
                Transform pos_target = CurEmptySlot.curRune.transform;

                Vector3 targetWorldPos = pos_target.position;
                _canChange = false;
                Tweener tweener = pos_start.DOMove(targetWorldPos, 0.5f)
                                    .SetEase(Ease.OutQuad)
                                    .SetAutoKill(true)
                                    .OnComplete(() =>
                                    {
                                        CurSelectedSlot.curRune.transform.SetParent(CurEmptySlot.transform, true);
                                        CurEmptySlot.curRune.transform.SetParent(CurSelectedSlot.transform, false);
                                        //Debug.Log("********����λ���ƶ��������");
                                        CurSelectedSlot.isEmpty = true;
                                        CurEmptySlot.isEmpty = false;

                                        CurEmptySlot.UpdateCurRune();
                                        CurSelectedSlot.UpdateCurRune();
                                        CurEmptySlot.CheckIsMatch();
                                        CurSelectedSlot.CheckIsMatch();

                                        if(_worldType==EWorldType.A)
                                        {
                                            GetEmptySlot();
                                            ChangeSelectedIndex(CurSelectedSlotIndex);
                                        }
                                        else
                                        {
                                            CurSelectedSlot = CurEmptySlot;
                                            GetEmptySlot();
                                        }
                                  
                                        pos_start.localScale= Vector3.one;
                                        _canChange=true;
                                        //Debug.Log("<color=green>********���¿ղ�</color>");
                                    });
            }
            else
            {
                Debug.LogError("<color=red>CurSelectedSlot��CurEmptySlot�µ�curRuneΪ�գ��޷�ִ�ж���</color>");
            }
        }
        else
        {
            Debug.LogError("<color=red>CurSelectedSlot��CurEmptySlotΪ�գ��޷�ִ�з��Ľ�������</color>");
        }
    }
    private void GetEmptySlot()
    {
        foreach (Slot slot in slots)
        {
            if (slot != null && slot.isEmpty)
            {
                CurEmptySlot = slot;
                break;
            }
        }
        if (CurEmptySlot != null)
        {
            Debug.Log("<color=green>�ɹ��ҵ��ղۣ�CurEmptySlotID:</color>" + CurEmptySlot.slotID);
        }
        else
        {
            Debug.LogError("<color=red>δ�ҵ���slot</color>");
        }

    }
    private Button[] GetSlotButtons()
    {
        Button[] buttons = new Button[slots.Length];

        for (int i = 0; i < slots.Length; i++)
        {
            Button btn = slots[i].GetComponent<Button>();
            if (btn != null)
            {
                buttons[i] = btn;
            }
            else
            {
                Debug.LogWarning($"Slot at index {i} does not have a Button component attached.");
            }
        }
        return buttons;
    }
    private void OnSlotButtonClick(int buttonIndex)
    {
        if (_worldType == EWorldType.A || !_canInput)
            return;
        CurSelectedSlot = slots[buttonIndex];
   
        if (CurSelectedSlot != null)
        {
         
            if (IsAdjacentSlot(CurSelectedSlot))
            {
                
                runeDesc.text = DataModule.Resolve<GameStatusDM>().GetRuneDesc(CurSelectedSlot.curRune.runeID);
                Debug.Log(runeDesc.text);
                ChangeRune();
            }
        }
    }
    private bool IsAdjacentSlot(Slot slot)
    {
        if (CurEmptySlot != null && CurEmptySlot.adjacentSlots != null)
        {
            return CurEmptySlot.adjacentSlots.Contains(slot);
        }
        return false;
    }
    private void IsAllMatch()
    {
        bool allMatch = true;
        foreach (Slot slot in slots)
        {
            if (slot != null && !slot.getIsMatch())
            {
                allMatch = false;
                break;
            }
        }
        if (allMatch && !isGameSuccess)
        {
            Debug.Log("<color=green>��Ϸ�ɹ�</color>");
            isGameSuccess = true;
        }
    }

    private void SaveRuneDesc(string inputText)
    {
        _canInput = true;
        Debug.Log("6666666666666666");
        if (CurSelectedSlot != null && CurSelectedSlot.curRune.runeID != 0)
        {
            DataModule.Resolve<GameStatusDM>().UpdateRuneDesc(CurSelectedSlot.curRune.runeID, inputText);

        }
    }

}
