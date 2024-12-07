using System;
using System.Collections.Generic;
using UnityEngine;

public class TriggerSense: MonoBehaviour
{
    public List<Collider> checks=new(capacity:4);

    public Action<Collider,bool> _listener;
    public Func<Collider, bool> _interstedCheck;
    bool _init;

    public void AddHandler(Action<Collider,bool> listener,Func<Collider,bool> interstedCheck)
    {
        _init = true;
        _listener += listener;
        _interstedCheck += interstedCheck;
    }
    public void RemoveHandler(Action<Collider,bool> listener,Func<Collider,bool> interstedCheck)
    {
        _init = false;
        _listener -= listener;
        _interstedCheck -= interstedCheck;

    }

    private void OnTriggerEnter(Collider other)
    {
        if ( _init&&_interstedCheck.Invoke(other) )
        {
            if ( !checks.Contains(other) )
            {
                checks.Add(other);
                _listener.Invoke(other, true);
            }
        }
    }
    private void OnTriggerStay(Collider other)
    {
        if ( _init && _interstedCheck.Invoke(other) )
        {
            if ( !checks.Contains(other) )
            {
                checks.Add(other);
                _listener.Invoke(other, true);
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if ( _init && _interstedCheck.Invoke(other) )
        {
            if ( checks.Contains(other) )
            {
                checks.Remove(other);
                _listener.Invoke(other, false);
            }
        }
    }
}
