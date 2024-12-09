using System;
using System.Collections.Generic;
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
    TMP_Text txt_drug;

    [SerializeField]
    Transform tran_health;
    [SerializeField]
    GameObject go_health;

    List<GameObject> healths = new();


    #region Unity

    private void Awake()
    {
        EventAggregator.Subscribe<SPlayerChangeHealth>(OnHealthChange);
        EventAggregator.Subscribe<SPlayerChangeSp>(OnSpChange);
        EventAggregator.Subscribe<SOnDrugScoreChange>(OnDrugChange);
    }
    private void OnDisable()
    {
        EventAggregator.Unsubscribe<SPlayerChangeHealth>(OnHealthChange);
        EventAggregator.Unsubscribe<SOnDrugScoreChange>(OnDrugChange);
        EventAggregator.Unsubscribe<SPlayerChangeSp>(OnSpChange);
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

    }
    void OnSpChange(SPlayerChangeSp evt)
    {
        img_sp.fillAmount=evt.cur/evt.max;

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
