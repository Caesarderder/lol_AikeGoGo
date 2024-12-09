using System;
using System.Collections.Generic;
using UnityEngine;

public enum EBuffType
{
    Hp,
    Sp,
    MoveSpeed,
}
namespace FSM
{
    public class InterackAddBuffAction : InteractAction 
    {
        Transform player;
        PlayerEntity playerEntity;

        public string animationName;

        public EBuffType type;
        public float value=1f;

        [SerializeField]
        Transform checkPos;

        private void Start()
        {
            playerEntity=DataModule.Resolve<GamePlayDM>().GetPlayer();
            player = playerEntity.transform;
            
        }
        public override bool CheckIfDoAction()
        {
            return player.position.x > checkPos.position.x&&base.CheckIfDoAction();
        }


        bool isApply;
        public override void DoAction()
        {
            base.DoAction();
            entity.Animator.SetTrigger(animationName);
            isApply = false;

            
        }
        public override void OnAction(int index)
        {
            base.OnAction(index);
            EndAction();
            
        }
        public override void EndAction()
        {
            base.EndAction();
            if(!isApply)
            {
                isApply= true;
                playerEntity.AddBuff(type, value);

            }
        }

    }
}