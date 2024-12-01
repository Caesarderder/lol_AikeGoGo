using UnityEngine;
using System;
using System.Collections.Generic;

public struct SAudioClipSettings
{
    public AudioClip Ac;
    public bool Loop;
    public Vector3 Pos;
}


public class AudioManager
{
    // �������ֵ���ƵԴ
    public AudioSource backgroundMusicSource;
    // ��Ч����ƵԴ��
    private List<AudioSource> soundEffectSources = new List<AudioSource>();
    // ��ЧԤ���б�
    public Dictionary<EAudioEffectIndex,AudioClip> soundEffects;

    GameObject go_asPool;

    // �������ֺ���Ч������
    [Range(0f, 1f)] public float backgroundMusicVolume = 1f;
    [Range(0f, 1f)] public float soundEffectVolume = 1f;

    private bool isMuted = false;  // �Ƿ���

    public void Init()
    {
        // ��ʼ����Ч����
        foreach ( var source in soundEffectSources )
        {
            source.volume = soundEffectVolume;
        }
        go_asPool=ResManager.MonoManager.AudioPool.gameObject;
        soundEffects = Manager<TableManager>.Inst.AudioConfig.Dics;

        // ��ʼ��������������
        backgroundMusicSource= GetAvailableSoundEffectSource();
        backgroundMusicSource.loop = true;
        backgroundMusicSource.volume = backgroundMusicVolume;

    }

    // ���ű�������
    public void PlayBackgroundMusic(AudioClip musicClip)
    {
        // ������ڲ��ŵı������ֺ��²��ŵ�����һ���������κδ���
        if ( backgroundMusicSource.isPlaying && backgroundMusicSource.clip == musicClip ) return;

        backgroundMusicSource.clip = musicClip;
        backgroundMusicSource.Play();
    }

    // �л���������
    public void SwitchBackgroundMusic(AudioClip musicClip)
    {
        backgroundMusicSource.Stop();
        backgroundMusicSource.clip = musicClip;
        backgroundMusicSource.Play();
    }

    // ֹͣ��������
    public void StopBackgroundMusic()
    {
        backgroundMusicSource.Stop();
    }

    // ������Ч
    public void PlaySoundEffect(EAudioEffectIndex effectIndex)
    {
        // ȷ��������Ч
            AudioSource soundEffectSource = GetAvailableSoundEffectSource();
            soundEffectSource.clip = soundEffects[effectIndex];
            soundEffectSource.Play();
    }

    // ��ȡ���õ���Ч��Դ
    private AudioSource GetAvailableSoundEffectSource()
    {
        foreach ( AudioSource source in soundEffectSources )
        {
            if ( !source.isPlaying )
                return source;
        }

        // ���û�п�����ЧԴ���򴴽�һ���µ���ЧԴ
        AudioSource newSource = go_asPool.AddComponent<AudioSource>();
        newSource.volume = soundEffectVolume;
        newSource.loop = false;
        soundEffectSources.Add(newSource);
        return newSource;
    }

    // ��ͣ��������
    public void PauseAllMusic()
    {
        backgroundMusicSource.Pause();
        foreach ( var source in soundEffectSources )
        {
            source.Pause();
        }
    }

    // �ָ���������
    public void ResumeAllMusic()
    {
        backgroundMusicSource.UnPause();
        foreach ( var source in soundEffectSources )
        {
            source.UnPause();
        }
    }

    // ������ָ���Ч
    public void ToggleMute()
    {
        isMuted = !isMuted;
        backgroundMusicSource.mute = isMuted;
        foreach ( var source in soundEffectSources )
        {
            source.mute = isMuted;
        }
    }

    // ���ñ�����������
    public void SetBackgroundMusicVolume(float volume)
    {
        backgroundMusicVolume = volume;
        backgroundMusicSource.volume = volume;
    }

    // ������Ч����
    public void SetSoundEffectVolume(float volume)
    {
        soundEffectVolume = volume;
        foreach ( var source in soundEffectSources )
        {
            source.volume = volume;
        }
    }





}