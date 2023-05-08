using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Audio;

public class SoundManager : MonoBehaviour
{

    public AudioMixer _audioMixer;
    public Slider _MusicSlider;
    public Slider _MusicSlider1;
    public Slider _MusicSlider2;
    public Slider _MusicSlider3;
    public Slider _SFXSlider;
    private float musicvalue;
    private float musicvalue1;
    private float musicvalue2;
    private float musicvalue3;
    private float sfxvalue;
    public AudioSource _audioSource;
    public AudioSource _audioSource1;
    public AudioSource _audioSource2;
    public AudioSource _audioSource3;
    public AudioSource _SFXSource;


    public void PlaySound(AudioClip clip)
    {
        _audioSource.clip = clip;
        _audioSource.loop = true;
        _audioSource.Play();
    }

    public void PlaySound1(AudioClip clip)
    {
        _audioSource1.clip = clip;
        _audioSource1.loop = true;
        _audioSource1.Play();
    }

    public void PlaySound2(AudioClip clip)
    {
        _audioSource2.clip = clip;
        _audioSource2.loop = true;
        _audioSource2.Play();
    }

    public void PlaySound3(AudioClip clip)
    {
        _audioSource3.clip = clip;
        _audioSource3.loop = true;
        _audioSource3.Play();
    }

    public void StopSound(AudioClip clip)
    {
        _audioSource.clip = clip;
        _audioSource.loop = false;
        _audioSource.Stop();
    }

    public void StopSound1(AudioClip clip)
    {
        _audioSource1.clip = clip;
        _audioSource1.loop = false;
        _audioSource1.Stop();
    }

    public void StopSound2(AudioClip clip)
    {
        _audioSource2.clip = clip;
        _audioSource2.loop = false;
        _audioSource2.Stop();
    }

    public void StopSound3(AudioClip clip)
    {
        _audioSource3.clip = clip;
        _audioSource3.loop = false;
        _audioSource3.Stop();
    }

    public void StartSFX(AudioClip clip)
    {
        _SFXSource.clip = clip;
        _SFXSource.Play();

    }

    public void SetMusicVolume()
    {
        _MusicSlider.onValueChanged.AddListener(delegate { OnMusicVolumeChanged(); });
    }

    private void OnMusicVolumeChanged()
    {
        _audioSource.volume = _MusicSlider.value;
        _audioSource1.volume = _MusicSlider1.value;
        _audioSource2.volume = _MusicSlider2.value;
        _audioSource3.volume = _MusicSlider3.value;
    }
    public void ChangeMusicVolume(float volume)
    {
        _audioSource.volume = volume;
        _audioSource1.volume = volume;
        _audioSource2.volume = volume;
        _audioSource3.volume = volume;
        _MusicSlider.value = volume;
        _MusicSlider1.value = volume;
        _MusicSlider2.value = volume;
        _MusicSlider3.value = volume;
    }

    public void SetSFXVolume()
    {
        _SFXSlider.onValueChanged.AddListener(delegate { OnSFXVolumeChanged(); });
    }

    private void OnSFXVolumeChanged()
    {
        _SFXSource.volume = _SFXSlider.value;
    }
    public void ChangeSFXVolume(float sfxvolume)
    {
        _SFXSource.volume = sfxvolume;
        _SFXSlider.value = sfxvolume;
    }



}