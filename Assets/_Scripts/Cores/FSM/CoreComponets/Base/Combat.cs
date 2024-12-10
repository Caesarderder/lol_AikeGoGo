using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class Combat : CoreComponent ,IAttackable
    {
        private Stats Stats;
        public PlayerEntity player=>(PlayerEntity) Entity;
        [SerializeField]
        TriggerSense ts;
        Action<IAttackable> onAttack;
        public bool CanReceiveDamage;

        protected  void Start()
        {
            Stats = core.GetCoreComponent<Stats>();
            ts.AddHandler(OnAttackCheck,IsAttackable);
            CanReceiveDamage = true;
        }

        public void AddAttackHandler(Action<IAttackable> attack)
        {
            onAttack += attack;
        }
        public void RemoveAttackHandler(Action<IAttackable> attack)
        {
            onAttack -= attack;
        }

        float _uid;
        public void ReceiveDamage(float uid,float damage)
        {
            if ( Mathf.Approximately(_uid, uid) ||!CanReceiveDamage)
                return;
            player.GoContainer.RestartParticle(4);
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

        bool IsAttackable(Collider collider)
        {
            if ( collider.TryGetComponent<IAttackable>(out var attak) )
                return true;
            var attak2 = collider.GetComponentInParent<IAttackable>();
            if ( attak2 != null )
                return true;
            return false;
        }

        void OnAttackCheck(Collider collider,bool isEnter)
        {
            if(isEnter)
            {
                if ( collider.TryGetComponent<IAttackable>(out var attak) )
                    onAttack?.Invoke(attak);
                var attak2 = collider.GetComponentInParent<IAttackable>();
                if ( attak2 != null )
                    onAttack?.Invoke(attak2);
            }
        }

    }
}