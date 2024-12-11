using System;
using TMPro;
using UniRx;
using UnityEngine;
using UnityEngine.UI;

public class HomePanel : ViewBase
{
    [SerializeField]
    TMP_Text txt_history;

    [SerializeField]
    Button 
        btn_desc,
        btn_maker,
        btn_start
        ;

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

        txt_history.text = "最多摧毁微光数量："+PlayerPrefs.GetInt("Score").ToString();
        btn_start.OnClickAsObservable().Subscribe(x => {
            _ = Manager<ActManager>.Inst.LoadAct<GameAct>();
        }).AddTo(this);


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
