using UnityEditor.Rendering;
using UnityEngine;

public class BagManager
{
    private readonly Intent intent;

    public BagManager(Intent intent)
    {
        this.intent = intent;
        intent.AddInt("bagCapacity", 1);   // Ĭ������Ϊ 1
        intent.AddObject("bagItem", null); // Ĭ��û����Ʒ
    }

    // �����Ʒ������
    public bool AddItem(GameObject item)
    {
        if (intent.GetObject("bagItem") == null)
        {
            intent.AddObject("bagItem", item);
            item.SetActive(false); // ʰȡ֮��������Ʒ
            Debug.Log($"Added {item.name} to bag.");
            return true;
        }
        else
        {
            RemoveItem();   //�����������Զ�����
            AddItem(item);
            Debug.Log("bag is full!drop!");
            return false;
        }
    }

    // �ӱ����Ƴ���Ʒ
    public GameObject RemoveItem()
    {
        GameObject item = intent.GetObject("bagItem") as GameObject;
        if (item != null)
        {
            intent.AddObject("bagItem", null);
            item.SetActive(true); // ��ʾ��Ʒ
            //// ����Ҹ���������Ʒ
            //Vector3 dropPosition = player.transform.position + new Vector3(Random.Range(-2f, 2f), 1f, Random.Range(-2f, 2f));
            //item.transform.position = dropPosition;

            Debug.Log($"Removed {item.name} from bag.");
            return item;
        }
        return null;
    }

    // ��鱳���Ƿ�����Ʒ
    public bool HasItem()
    {
        return intent.GetObject("bagItem") != null;
    }
}
