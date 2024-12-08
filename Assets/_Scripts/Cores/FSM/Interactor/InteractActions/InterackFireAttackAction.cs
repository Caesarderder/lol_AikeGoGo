using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class InterackFireAttackAction : InteractAction 
    {
        Transform player;

        [SerializeField]
        TriggerSense sense;

        public Transform checkPos;
        public string animationName;

        public float damage=10f;
        public GameObject go_bullet;
        AttackUid _attackUid=new();

        private void Start()
        {
            player=DataModule.Resolve<GamePlayDM>().GetPlayer().transform;
        }
        public override bool CheckIfDoAction()
        {
            return player.position.x > checkPos.position.x;
        }

        public override void DoAction()
        {
            base.DoAction();
            sense.AddHandler(OnTrigger, PlayerCheck);
            entity.Animator.SetTrigger(animationName);
            _attackUid.Reset();
            
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