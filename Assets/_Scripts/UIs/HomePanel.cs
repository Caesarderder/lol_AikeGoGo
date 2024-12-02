using System;
using TMPro;
using UniRx;
using UnityEngine;
using UnityEngine.UI;

public class HomePanel : ViewBase
{
    [SerializeField]
    TMP_InputField if_num;
    [SerializeField]
    Button 
        btn_start
        ;

    //UI��ʱ��������
    public void Init(int num)
    {
        if_num.text = num.ToString();
    }
    

#region Unity

    private void Start()
    {
    }

    private void Update()
    {
    }
    public override void Show()
    {
        base.Show();

        if_num.onEndEdit.AddListener((x =>
        {
            DataModule.Resolve<TestDataModule>().OnTestDataChange(int.Parse(x));
        }));
        btn_start.OnClickAsObservable().Subscribe(async x => {
            await Manager<UIManager>.Inst.ShowUI<GamePlayPanel>();  //��̬����GamePlayPanel
            _ = Manager<ActManager>.Inst.LoadAct<GameAct>();

        });


    }

    public override void Destroy()
    {
        base.Destroy();
    }

    public override void Hide()
    {
        base.Hide();
        if_num.onEndEdit.RemoveAllListeners();
    }

    public override void Load()
    {
        base.Load();
    }

    #endregion

    
    


}
