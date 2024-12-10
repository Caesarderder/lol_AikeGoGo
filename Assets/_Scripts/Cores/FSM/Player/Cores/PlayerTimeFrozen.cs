using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public struct SChannelTimeFrozen
{
    public bool isEnter;
}
namespace FSM
{
    public class PlayerTimeFrozen: CoreComponent
    {
        //FSM
        private PlayerEntity Player;
        private PlayerInputHandler inputHandler;
        PlayerMovement movement;
        public bool IsFrozen;
 
        protected override void Awake()
        {
            base.Awake();
            Player=GetComponentInParent<PlayerEntity>();
            inputHandler=GetComponentInParent<PlayerInputHandler>();
        }
        private void Start()
        {
            movement=Player.Movement;
            
        }
        public void Enter()
        {
            if ( IsFrozen )
                return;
            IsFrozen = true;
            Time.timeScale = 0.05f;
            //Player.Animator.speed = 10f;

            EventAggregator.Publish(new SChannelTimeFrozen()
            {
                isEnter = true,
            });
        }
        public async void Exit()
        {
            StartCoroutine(IEExit());
        }

        IEnumerator IEExit()
        {
            yield return new WaitForSeconds(0.04f);
            if(IsFrozen)
            {
                IsFrozen = false;
                Time.timeScale = 1f;
                //Player.Animator.speed = 1f;
                EventAggregator.Publish(new SChannelTimeFrozen()
                {
                    isEnter = false,
                });

            }
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
            //if(inputHandler.Spell3)
            //{
            //    if(IsFrozen)
            //    {
            //        Exit();
            //    }
            //    else
            //        Enter();
            //    inputHandler.Spell3 = false;
            //}
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
        }
    }
}
