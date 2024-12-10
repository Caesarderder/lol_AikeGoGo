using System;
using System.Collections.Generic;
using UnityEngine;


namespace FSM
{
    public class InterackFireAttackAction : InteractAction 
    {
        Transform player;

        [SerializeField]
        int particleIndex;

        public Transform checkPos;
        public string animationName;

        public float damage=10f;
        public float bulletVelocity=10f;
        public GameObject go_bullet;
        [SerializeField]
        Transform firPos;

        private void Start()
        {
            player=DataModule.Resolve<GamePlayDM>().GetPlayer().transform;
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
            if(index==100)
            {
                var container = entity.GetComponentInChildren<GoContainer>();
                if(container!=null)
                {
                    container.RestartParticle(particleIndex);
                }
            }    
            else
                EndAction();

            
        }
        public override void EndAction()
        {
            base.EndAction();
            var bullet= Instantiate(go_bullet, firPos.position, Quaternion.FromToRotation(-transform.forward,transform.forward)).GetComponent <Bullet>();
            bullet.Fire(transform.right, damage, bulletVelocity);
        }

    }
}