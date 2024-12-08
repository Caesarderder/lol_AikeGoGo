
using UnityEngine;

public class InstanceAttackTarget
{
    IAttackable target;
    Transform tran;
    public void Init(IAttackable attackable,Transform transform)
    {
        target = attackable;
        tran = transform;
    }

    public void OnEnable()
    {
        EventAggregator.Subscribe<SStartInstanceAttack>(OnStartInstanceAttack);
        EventAggregator.Subscribe<SEndInstanceAttack>(OnEndInstanceAttack);
    }
    public void OnDisable()
    {
        EventAggregator.Unsubscribe<SStartInstanceAttack>(OnStartInstanceAttack);
        EventAggregator.Unsubscribe<SEndInstanceAttack>(OnEndInstanceAttack);
        EventAggregator.Publish(new SHideAttackIcon()
        {
            Attackable = target
        });
    }

    void OnStartInstanceAttack(SStartInstanceAttack evt)
    {

        EventAggregator.Publish(new SShowAttackIcon()
        {
            Attackable = target,
            pos=tran,
            
        });

    }
    public void OnEndInstanceAttack(SEndInstanceAttack evt)
    {
        EventAggregator.Publish(new SHideAttackIcon()
        {
            Attackable = target
        });

    }



}