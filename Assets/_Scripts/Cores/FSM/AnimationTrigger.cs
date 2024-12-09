using System;
using System.Collections.Generic;
using UnityEngine;

public class AnimationTrigger: MonoBehaviour
{
    public Action<int> action;
    public void OnAnimationTrigger(int i)
    {
        action?.Invoke(i);
    }
}
