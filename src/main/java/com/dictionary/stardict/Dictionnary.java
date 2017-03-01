/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dictionary.stardict;

//import com.sun.speech.freetts.Voice;
//import com.sun.speech.freetts.VoiceManager;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

/**
 *
 * @author tran
 */
public class Dictionnary {
    private static final String VOICENAME = "kevin16";

    public static void main(String[] args) {
        Path path = Paths.get("../webapp/resources/AnhViet/star_anhviet.ifo");
        StarDict dictionary = new StarDict("");
        List<Word> word = dictionary.getNearestWords("bana");
        for (Word w : word){
            System.out.println(w.getStrWord());
        }

//        Voice voice;
//        VoiceManager vm = VoiceManager.getInstance();
//        voice = vm.getVoice(VOICENAME);
//        voice.allocate();
//
//        voice.speak("Hello");
    }
}
