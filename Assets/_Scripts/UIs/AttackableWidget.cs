using FSM;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public struct SInstanceAttackTarget
{
    public IAttackable Attackable;
    public Vector3 pos;
}
public struct SStartInstanceAttack
{
}
public struct SEndInstanceAttack
{
}
public struct SShowAttackIcon
{
    
    public IAttackable Attackable;
    public Transform pos;
}
public struct SHideAttackIcon
{
    public IAttackable Attackable;
}
public class AttackableWidget : MonoBehaviour
{
    public GameObject go;
    Dictionary<IAttackable, (GameObject go,Transform target)> attacks=new();
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        EventAggregator.Subscribe<SShowAttackIcon>(ShowAttackIcon);
        EventAggregator.Subscribe<SHideAttackIcon>(HideAttackIcon);
    }
    private void OnDestroy()
    {
        EventAggregator.Unsubscribe<SShowAttackIcon>(ShowAttackIcon);
        EventAggregator.Unsubscribe<SHideAttackIcon>(HideAttackIcon);
        
    }

    void ShowAttackIcon(SShowAttackIcon evt)
    {
        if(!attacks.ContainsKey(evt.Attackable))
        {
            var newGo=Instantiate(go,transform);
            newGo.SetActive(true);
            newGo.GetComponent<Button>().onClick.AddListener(()=>
            {
                EventAggregator.Publish(new SInstanceAttackTarget()
                {
                    Attackable = evt.Attackable,
                    pos=evt.pos.position,
                });
            });
            attacks.Add(evt.Attackable, (newGo, evt.pos));
            SetGoPos(evt.Attackable);
        }
    }
    void SetGoPos(IAttackable attackable)
    {
        if(attacks.ContainsKey(attackable))
        {
            if ( attacks[attackable].target == null )
                attacks.Remove(attackable);
            var pos=Camera.main.WorldToScreenPoint(attacks[attackable].target.position) ;
            attacks[attackable].go.transform.position=pos;
        }
    }
    void HideAttackIcon(SHideAttackIcon evt)
    {
        if(attacks.ContainsKey(evt.Attackable))
        {
            GameObject.Destroy(attacks[evt.Attackable].go);
            attacks.Remove(evt.Attackable);
        }

    }
    // Update is called once per frame
    void Update()
    {
        foreach ( var attack in attacks ) {
            SetGoPos(attack.Key);
        }
        
    }
}
