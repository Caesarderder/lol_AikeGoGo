using System;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class MoveButton : MonoBehaviour,IPointerDownHandler,IPointerUpHandler
{
    Action<bool> ation;

    public void Bind(Action<bool> action)
    {
        ation = action;
    }

    public void OnPointerDown(PointerEventData eventData)
    {
        ation?.Invoke(true);
    }

    public void OnPointerUp(PointerEventData eventData)
    {
        ation?.Invoke(false);
    }
}
