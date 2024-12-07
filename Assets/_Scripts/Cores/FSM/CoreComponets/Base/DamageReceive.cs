using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class DamageReceive : CoreComponent ,IAttackable
    {
        private Stats Stats;
        public bool CanReceiveDamage;

        protected  void Start()
        {
            Stats = core.GetCoreComponent<Stats>();
            CanReceiveDamage = true;
        }

        float _uid;
        public void ReceiveDamage(float uid,float damage)
        {
            if ( Mathf.Approximately(_uid, uid) ||!CanReceiveDamage)
                return;
            _uid = uid;
            Stats.HealthChange(-damage);
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
        }

        protected override void Awake()
        {
            base.Awake();
        }

    }
}