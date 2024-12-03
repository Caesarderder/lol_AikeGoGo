using System.Collections;
using System.Collections.Generic;
using UnityEngine;
namespace FSM
{
    public class PlayerSense : Sense
    {
        //FSM
        private PlayerEntity Player;
        private PlayerInputHandler inputHandler;
        [SerializeField]
        protected float _JumpDownCheckDis=0.3f;
        public bool IsJumpDown;

        protected override void Awake()
        {
            base.Awake();
            Player=GetComponentInParent<PlayerEntity>();
            inputHandler=GetComponentInParent<PlayerInputHandler>();
        }
        public override void GroundCheck()
        {
            base.GroundCheck();
            var hit = Physics.Raycast(transform.position, Vector2.down, _JumpDownCheckDis, _wahtIsGround);

            if (hit)
            {
                IsJumpDown = true;
            }
            else
                IsJumpDown = false;
        }
        public override void OnDrawGizmos()
        {
            base.OnDrawGizmos();
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
        }
    }
}
