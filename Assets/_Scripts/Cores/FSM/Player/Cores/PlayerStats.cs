using UnityEngine;
using UnityEngine.Events;

namespace FSM
{
    public class PlayerStats:Stats
    {
        public override void HealthChange(float value)
        {
            var old=CurHP;
            base.HealthChange(value);
            EventAggregator.Publish(new SPlayerChangeHealth
            {
                old = old,
                cur=CurHP,
                max=MaxHP
            });

        }    
    }
}