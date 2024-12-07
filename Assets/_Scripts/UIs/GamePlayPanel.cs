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


    #region Unity

    private void OnEnable()
    {
        EventAggregator.Subscribe<SPlayerChangeHealth>(OnHealthChange);
    }
    private void OnDisable()
    {
        
        EventAggregator.Unsubscribe<SPlayerChangeHealth>(OnHealthChange);
    }
    void OnHealthChange(SPlayerChangeHealth evt)
    {
        img_health.fillAmount=evt.cur/evt.max;

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
