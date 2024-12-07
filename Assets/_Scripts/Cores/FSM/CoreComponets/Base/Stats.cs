using UnityEngine;
using UnityEngine.Events;

namespace FSM
{
    public class Stats:CoreComponent 
    {
        public float CurHP;
        public float MaxHP;

        public UnityAction<float> ChannelHealthChange;
        public UnityAction ChannelDie;

        protected override void Awake()
        {
            base.Awake();
            CurHP = MaxHP = Entity.EntityData.MaxHP;
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
        }
        public virtual void HealthChange(float value)
        {
            Debug.Log("ChangeHealth" + value);
            CurHP=Mathf.Clamp(CurHP+value, 0, MaxHP);
            ChannelHealthChange?.Invoke(value);
            if (CurHP <= 0)
            {
                //Entity.Die();
                ChannelDie?.Invoke();
            }
        }    
    }
}