using UnityEngine;
using System.Collections;

public class ray_test: MonoBehaviour
{

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {//�ж�����Ƿ���
            // ���������ʼ������Ļ�����㣬����һ������
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            // ײ�������ĸ�3D����
            RaycastHit hit;
            if (Physics.Raycast(ray, out hit))
            {
                Debug.Log(hit.transform.name);//��ӡ����ײ���Ľڵ������
            }
        }
    }
}