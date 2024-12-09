using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class InteractContinueAttackAction : InteractAction 
    {
        Transform player;

        [SerializeField]
        TriggerSense sense;

        public Transform checkPos;
        public string animationName;

        public float damage=10f;
        AttackUid _attackUid=new();

        private void Start()
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
            entity.Animator.SetTrigger(animationName);
        }
            
         public override void OnAction(int index)
        {
            base.OnAction(index);
            if(index==0)
            {
                sense.AddHandler(OnTrigger, PlayerCheck);
                _attackUid.Reset();
            }
            else if(index==1)
            {
                EndAction();
            }
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