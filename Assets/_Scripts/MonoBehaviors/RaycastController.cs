using UnityEngine;
using UnityEngine.UI;

public class RaycastController : MonoBehaviour
{
    public Camera rightCamera;           // �Ҳ���ҵ����
    public RawImage rightRawImage;       // �Ҳ���ҵ� RawImage

    public GameObject Go1;
    public GameObject Go2;
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            // ������Ƿ��� RawImage ��
            Vector2 localMousePos;
            RectTransform rectTransform = rightRawImage.rectTransform;
            Vector3 localPos = Input.mousePosition - Vector3.right * 960f;
            //    //���ڽ�ȫ����Ļ����ת��Ϊ RawImage �ľֲ����ꡣ
            //    //RectTransformUtility.ScreenPointToLocalPointInRectangle(rectTransform, Input.mousePosition, null, out localMousePos);

            //    //Debug.Log(Input.mousePosition + "  => " + localMousePos);

            if (rectTransform.rect.Contains(localPos))
            {
                //        //// �������Ҳ� RawImage �ı���λ��
                //        //float normalizedX = (localMousePos.x - rectTransform.rect.x) / rectTransform.rect.width;
                //        //float normalizedY = (localMousePos.y - rectTransform.rect.y) / rectTransform.rect.height;

                //        //// ������λ��ת��Ϊ�Ҳ��������Ļ�ռ�λ��
                //        //Vector3 cameraScreenPos = new Vector3(normalizedX * Screen.width, normalizedY * Screen.height, 0);

                // ʹ���Ҳ�����ӵ��λ�÷�������
                Ray ray = rightCamera.ScreenPointToRay(localPos);
                Debug.Log(ray.GetPoint(0f) + " " + ray.GetPoint(2f));
                Go1.transform.position = ray.GetPoint(0f);
                RaycastHit hit;
                if (Physics.Raycast(ray, out hit))
                {
                    Debug.Log("Hit object: " + hit.transform.name);
                    Go2.transform.position = hit.transform.position;
                }
                else
                    Go2.transform.position = ray.GetPoint(2f);
            }
        }
    }
}

