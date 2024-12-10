using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class PlayerInstanceAttakState : ActionState
    {
        private PlayerEntity player;
        private PlayerMovement movement;
        private Combat combat;
        private PlayerSense sense;
        private PlayerStats Stats;

        private PlayerInputHandler inputHandler;
        private PlayerDataSO data;



        //State
        AttackUid attackUid ;
        private string _animationName;
        private int _jumpCount;
        float spCost;
        public SInstanceAttackTarget attack;

        public PlayerInstanceAttakState(Entity Entity, PlayerNormalState NormalState,PlayerEntity player, string anmationName):base(Entity,NormalState)
        {
            this.player = player;
            movement = player.Movement;
            combat = player.Combat;
            Stats = player.Stats;
            sense = player.Sense;
            inputHandler = player.InputHandler;
            data = player.Data;
            _animationName = anmationName;
            _jumpCount = data.JumpCount;
            attackUid = new();
            spCost = data.InstaceAttackSpCost;
        }

        public override void Enter()
        {
            base.Enter();
            attackUid.Reset();
            movement.CanMove = false;
            attack.Attackable.ReceiveDamage(attackUid.value,data.NormalAttackDamage);
            movement.MoveToTarget(new Vector3(attack.pos.x,attack.pos.y,player.transform.position.z));
            player.Animator.SetTrigger("InstanceAttack");
            Stats.SpChange(-spCost);

        }
        public override void Exit()
        {
            base.Exit();
            movement._canMove=true;
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
            //HorizontalMove();
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
            //CheckIfTransition();
        }

        public override void AnimationFinishedTrigger(int i = 0)
        {
            if(i==0)
            {
            isAbilityDone = true;

            }
            if ( i == 100 )
                player.GoContainer.RestartParticle(0);
               }
        

    }
}
public struct OnChangeCameraPos
{
public    Vector3 worldPos;
}
