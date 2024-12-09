using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class AttackUid
    {
        public float value;
        public void Reset()
        {
            value = UnityEngine. Random.Range(-10000f,100000f);
        }
    }
    public class InteractMeleeAttackAction:InteractAction 
    {
        Transform player;

        [SerializeField]
        TriggerSense sense;

        public Transform checkPos;
        public string animationName;

        public float damage=10f;
        AttackUid _attackUid=new();

        protected virtual void Start()
        {
            player=DataModule.Resolve<GamePlayDM>().GetPlayer().transform;
            checkPos.position += Vector3.right * UnityEngine.Random.Range(-0.5f, 0.5f);
        }
        public override bool CheckIfDoAction()
        {
            return player.position.x > checkPos.position.x&&base.CheckIfDoAction();
        }

        public override void DoAction()
        {
            base.DoAction();
            sense.AddHandler(OnTrigger, PlayerCheck);
            entity.Animator.SetTrigger(animationName);
            _attackUid.Reset();
        }


         public override void OnAction(int index)
        {
            base.OnAction(index);
            EndAction();

        }
        public override void EndAction()
        {
            base.EndAction();
            sense.RemoveHandler(OnTrigger, PlayerCheck);
        }

        bool PlayerCheck(Collider collider)
        {
            var player = collider.GetComponentInParent<PlayerEntity>();
            return player != null;
        }

        private void OnTrigger(Collider other,bool isEnter)
        {
            if(isEnter)
            {
                var player = other.GetComponentInParent<PlayerEntity>();
                if(player!=null)
                    player.Combat.ReceiveDamage(_attackUid.value, damage);
            }
        }
    }
}