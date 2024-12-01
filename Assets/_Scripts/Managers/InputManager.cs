using UnityEngine;
using UnityEngine.InputSystem;
using System;

public class InputManager
{
    public static string MOVE = "Move";
    public static string INTERACT = "Interact";
    public static string CURSORLEFT = "CursorLeft";
    public static string CURSORRIGHT = "CursorRight";
    public static string ESC= "Esc";

    // ���ڰ󶨲�����ֵ���͵����루�����������������ṹ�壩
    public void InputValueBinding<T>(string name, Action<bool, T> listener) where T : struct
    {
        var action = InputSystem.actions.FindAction(name);
        if (action != null)
        {
            action.started += (x) => {
                var data = x.ReadValue<T>();
                listener?.Invoke(true, data);
            };
            action.performed += (x) => {
                var data = x.ReadValue<T>();
                listener?.Invoke(true, data);
            };

            action.canceled += (x) => {
                var data = x.ReadValue<T>();
                listener?.Invoke(false, data);
            };
        }
        else
            Debug.Log("Input action cannot find Action: " + name);
    }

    // ���ڰ󶨲�������ť���͵����루������
    public void InputButtonBinding(string name, Action<bool> listener)
    {
        var action = InputSystem.actions.FindAction(name);
        if (action != null)
        {
            action.started += (x) => {
                listener?.Invoke(true);
            };


            action.canceled += (x) => {
                listener?.Invoke(false);
            };
        }
        else
            Debug.Log("Input action cannot find Action: " + name);
    }

    public InputManager() { }
}