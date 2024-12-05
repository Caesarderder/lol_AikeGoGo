using UnityEngine;
using UnityEngine.Events;

namespace FSM
{
    public class Movement:CoreComponent 
    {
        //protected  Rb;
       

        public Vector2 TargetPos;

        protected float _targetMoveSpeed;
        protected float _curMoveSpeed;
        protected float _gravitySpeed;

        #region move logic
        protected bool _isJump;
        #endregion

        public float a;
        public bool CanMove;


        public bool IsMoving;
        public bool IsMovingToTargetPos;
        private int _isFacingRight;

        public UnityAction ChannelArrivedTarget;

        protected override void Awake()
        {
            base.Awake();
            //Rb=GetComponentInParent<Rigidbody>();
            _isFacingRight = 1;
        }

        public override void LogicUpdate()
        {
            base.LogicUpdate();
        }

        public override void PhysicsUpdate()
        {
            base.PhysicsUpdate();
            MoveToTargetPos();

        }

        //��Ҫ��State���ã�ִ���ƶ�----�����ƶ������Զ�ת��
        public virtual void HorizontalMove()
        {
            //if (!CanMove)
            //    return;
            //if (Mathf.Abs(Speed)> 0)
            //{
            //    IsMoving = true;
            //    //Rb.linearVelocity = new Vector2(MoveSpeed.x,Rb.linearVelocity.y);
            //}
            //else
            //{

            //    IsMoving = false;
            //}

        }
        public void Flip()
        {
            _isFacingRight*=-1;
            Entity.transform.Rotate(new Vector3(0f, 180f, 0f));
        }
        public virtual void SetTargetMoveSpeed(float horitalSpeed)
        {
            //MoveSpeed = new Vector2(horitalSpeed,Rb.linearVelocity.y);
        }
        public virtual void SetMoveSpeed(Vector2 velocity)
        {
            //MoveSpeed = velocity;
        }
        public virtual void SetTargetPos(Vector2 targetPos)
        {
            IsMovingToTargetPos = true;
            TargetPos = targetPos;
        }

        //IsMovingToTargetPos==true&&����TargetPos
        protected virtual void MoveToTargetPos()
        {
            if(IsMovingToTargetPos&&CanMove)
            {
                if (IsArrivedTargetPos())
                {
                    ChannelArrivedTarget?.Invoke();
                    IsMovingToTargetPos =false;
                    return;
                }
                    
                IsMoving = true;
                //Rb.linearVelocity = (TargetPos -(Vector2) Entity.transform.position).normalized*MoveSpeed.magnitude; 
            }
        }
        
        protected virtual bool IsArrivedTargetPos()
        {
            if((TargetPos - (Vector2)Entity.transform.position).magnitude<0.02f)
            {
                return true;
            }
            return false;
        }
        public void JumpByForce(float force)
        {
            //Rb.AddForce(Vector2.up*force);
        }
    }
}