using System;
using System.Collections.Generic;
using UnityEngine;

namespace FSM
{
    public class InteractAction : MonoBehaviour
    {
        protected InteractorEntity entity;
        protected bool isAction;
        public void Init(InteractorEntity entity)
        {
            this.entity= entity;
        }
        public virtual bool CheckIfDoAction()
        {
            return false;
        }

        public virtual void DoAction()
        {
            isAction = true;

        }
        public virtual void EndAction()
        {
            isAction = false;

        }
    }
}