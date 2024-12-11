using FSM;
using System;
using System.Collections.Generic;
using TMPro;
using UniRx;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.UI;
public struct SGameOver
{
}
public struct SPlayerChangeHealth
{
    public float old;
    public float cur;
    public float max;
}
public struct SPlayerChangeSp
{
    public float old;
    public float cur;
    public float max;
}

public class GamePlayPanel : ViewBase
{
    [SerializeField]
    Image img_sp;
    [SerializeField]
    TMP_Text 
        txt_title,
        txt_drug;

    [SerializeField]
    Transform tran_health;
    [SerializeField]
    GameObject go_health;

    [SerializeField]
    Button 
        btn_continue,
        btn_back,
        btn_restart,
        btn_pause;

    [SerializeField]
    GameObject go_Popup;

    List<GameObject> healths = new();

    int historyScore;
    int curSocre;

    GamePlayDM _dm;

    PlayerEntity player;

    //action
    [SerializeField]
    MoveButton
        btn_left,
        btn_right,
        btn_jump,
        btn_crouch,
        btn_instanceAttack,
        btn_timeBack;
    

    #region Unity

    private void Awake()
    {
        EventAggregator.Subscribe<SPlayerChangeHealth>(OnHealthChange);
        EventAggregator.Subscribe<SGameOver>(OnGameOver);
        EventAggregator.Subscribe<SPlayerChangeSp>(OnSpChange);
        EventAggregator.Subscribe<SOnDrugScoreChange>(OnDrugChange);
        _dm=DataModule.Resolve<GamePlayDM>();

        btn_continue.onClick.AddListener(()=>
        {
            go_Popup.SetActive(false);
            Time.timeScale = 1.0f;
        });

        btn_back.onClick.AddListener(async () =>
        {
            await Manager<ActManager>.Inst.LoadAct<HomeAct>();
            Time.timeScale = 1.0f;
        });

        btn_restart.onClick.AddListener(async () =>
        {
            await Manager<ActManager>.Inst.LoadAct<GameAct>();
            Time.timeScale = 1.0f;
        });

        btn_pause.onClick.AddListener(() =>
        {
            txt_title.text = "”Œœ∑‘›Õ£";
            btn_continue.gameObject.SetActive(true);

            go_Popup.SetActive(true);
            Time.timeScale= 0f;

        });

       historyScore = PlayerPrefs.GetInt("Score");
    }
    private void OnDisable()
    {
        EventAggregator.Unsubscribe<SPlayerChangeHealth>(OnHealthChange);
        EventAggregator.Unsubscribe<SOnDrugScoreChange>(OnDrugChange);
        EventAggregator.Unsubscribe<SPlayerChangeSp>(OnSpChange);
        EventAggregator.Unsubscribe<SGameOver>(OnGameOver);
        if ( curSocre > historyScore )
            PlayerPrefs.SetInt("Score", curSocre);
    }
    void OnHealthChange(SPlayerChangeHealth evt)
    {
        foreach ( var kvp in healths ) {
            Destroy(kvp);
        }
        healths.Clear();
        for ( int i = 0; i < evt.cur; i++ )
        {
            var go = Instantiate(go_health, tran_health);
            go.SetActive(true);
            healths.Add(go); 
        }
        if(evt.cur<=0)
        {
            GameOver();
        }

    }
    void OnGameOver(SGameOver evt)
    {
        GameOver();
    }
    private void GameOver()
    {
        txt_title.text = "”Œœ∑ ß∞‹";
        btn_continue.gameObject.SetActive(false);
        go_Popup.SetActive(true);
        Time.timeScale = 0f;
    }

    void OnSpChange(SPlayerChangeSp evt)
    {
        img_sp.fillAmount=evt.cur/evt.max;

    }
    void OnDrugChange(SOnDrugScoreChange evt)
    {
        curSocre=evt.value;
        txt_drug.text="score:"+evt.value;

    }
    private void Start()
    {
        player=DataModule.Resolve<GamePlayDM>().GetPlayer();
        var inputHandler = player.InputHandler;
        btn_left.Bind(x =>
        {
            if(x)
            {
                player.InputHandler.Move = -1;
                player.InputHandler.MoveNormalized= -1;
            }    
            else
            {
                player.InputHandler.Move = 0;
                player.InputHandler.MoveNormalized= 0;
            }

        });
        btn_right.Bind(x =>
        {
            if(x)
            {
                player.InputHandler.Move = 1;
                player.InputHandler.MoveNormalized= 1;
            }    
            else
            {
                player.InputHandler.Move = 0;
                player.InputHandler.MoveNormalized= 0;
            }

        });

        btn_jump.Bind(x =>
        {
            player.InputHandler.Jump = x;
        });
        btn_crouch.Bind(x =>
        {
            player.InputHandler.Crouch= x;
        });
        btn_instanceAttack.Bind(x =>
        {
            player.InputHandler.Spell2= x;
        });
        btn_timeBack.Bind(x =>
        {
            player.InputHandler.Spell1= x;
        });

    }

    void BindButton(Button btn,UnityAction action)
    {
        btn.onClick.AddListener(action);
    }

    private void Update()
    {
    }
    public override void Show()
    {
        base.Show();


    }

    public override void Destroy()
    {
        base.Destroy();
    }

    public override void Hide()
    {
        base.Hide();
    }

    public override void Load()
    {
        base.Load();
    }

    #endregion


}
