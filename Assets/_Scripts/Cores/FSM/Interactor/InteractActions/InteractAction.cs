using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class InteractAction : MonoBehaviour
    {
        protected InteractorEntity entity;
        protected bool isAction;
        public int SpCost=1;
        public void Init(InteractorEntity entity)
        {
            this.entity= entity;
        }
        public virtual bool CheckIfDoAction()
        {
            return entity.SP-SpCost>=0;
        }

        public virtual void DoAction()
        {
            isAction = true;
            entity.SP-=SpCost;

        }
        public virtual void OnAction(int flag)
        {
        }
        public virtual void EndAction()
        {
            isAction = false;

        }
    }
}