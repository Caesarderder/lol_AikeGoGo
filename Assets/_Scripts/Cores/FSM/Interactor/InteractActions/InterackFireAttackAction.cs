using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class InterackFireAttackAction : InteractAction 
    {
        Transform player;

        public Transform checkPos;
        public string animationName;

        public float damage=10f;
        public float bulletVelocity=10f;
        public GameObject go_bullet;

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
            entity.Animator.SetTrigger(animationName);
            
        }
        public override void EndAction()
        {
            base.EndAction();
            var bullet= Instantiate(go_bullet, transform.position, Quaternion.FromToRotation(-transform.forward,transform.forward)).GetComponent <Bullet>();
            bullet.Fire(transform.right, damage, bulletVelocity);
        }

    }
}