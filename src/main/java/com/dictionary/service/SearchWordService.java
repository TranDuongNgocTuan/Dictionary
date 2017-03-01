package com.dictionary.service;

import com.dictionary.stardict.StarDict;
import com.dictionary.stardict.Word;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by tran on 19/11/16.
 */
public class SearchWordService {
    public String meanWord(String word){
        ApplicationContext context =
                new ClassPathXmlApplicationContext("beans.xml");
        StarDict dict = (StarDict) context.getBean("starDict");
        String meanWord = dict.lookupWord(word);
        return meanWord;
    }

    public ArrayList<Word> listNearWord(String word){
        ApplicationContext context =
                new ClassPathXmlApplicationContext("beans.xml");
        StarDict dict = (StarDict) context.getBean("starDict");
        ArrayList<Word> wordList = (ArrayList<Word>) dict.getNearestWords(word);
        return wordList;
    }
}
