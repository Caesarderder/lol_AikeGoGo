using System;
using TMPro;
using UniRx;
using UnityEngine;
using UnityEngine.UI;
public struct SPlayerChangeHealth
{
    public float old;
    public float cur;
    public float max;
}

public class GamePlayPanel : ViewBase
{
    [SerializeField]
    Image img_health;
    [SerializeField]
    TMP_Text txt_drug;


    #region Unity

    private void OnEnable()
    {
        EventAggregator.Subscribe<SPlayerChangeHealth>(OnHealthChange);
        EventAggregator.Subscribe<SOnDrugScoreChange>(OnDrugChange);
    }
    private void OnDisable()
    {
        
        EventAggregator.Unsubscribe<SPlayerChangeHealth>(OnHealthChange);
        EventAggregator.Unsubscribe<SOnDrugScoreChange>(OnDrugChange);
    }
    void OnHealthChange(SPlayerChangeHealth evt)
    {
        img_health.fillAmount=evt.cur/evt.max;

    }
    void OnDrugChange(SOnDrugScoreChange evt)
    {
        txt_drug.text="score:"+evt.value;

    }
    private void Start()
    {
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
