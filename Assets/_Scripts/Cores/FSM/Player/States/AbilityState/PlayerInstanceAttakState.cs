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

        private PlayerInputHandler inputHandler;
        private PlayerDataSO data;



        //State
        AttackUid attackUid ;
        private string _animationName;
        private int _jumpCount;
        public SInstanceAttackTarget attack;

        public PlayerInstanceAttakState(Entity Entity, PlayerNormalState NormalState,PlayerEntity player, string anmationName):base(Entity,NormalState)
        {
            this.player = player;
            movement = player.Movement;
            combat = player.Combat;
            sense=player.Sense;
            inputHandler = player.InputHandler;
            data = player.Data;
            _animationName = anmationName;
            _jumpCount = data.JumpCount;
            attackUid = new(); 
        }

        public override void Enter()
        {
            base.Enter();
            attackUid.Reset();
            movement.CanMove = false;
            attack.Attackable.ReceiveDamage(attackUid.value,data.NormalAttackDamage);
            movement.MoveToTarget(new Vector3(attack.pos.x,attack.pos.y,player.transform.position.z));
            player.Animator.SetTrigger("InstanceAttack");
        }
        public override void Exit()
        {
            base.Exit();
            movement.CanMove=true;
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

        

    }
}