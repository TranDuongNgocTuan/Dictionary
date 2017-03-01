package com.dictionary.controllers;

import com.dictionary.service.SearchWordService;
import com.dictionary.stardict.StarDict;
import com.dictionary.stardict.Word;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by tran on 11/6/16.
 */
@Controller
public class SearchWordController {

    @RequestMapping(value = "/")
    public void home(){};

    @RequestMapping(value = "/searchword", method = RequestMethod.GET)
    public String searchWord(Model model, @RequestParam(name = "word")String word){
        SearchWordService searchWordService = new SearchWordService();

        String meanWord = searchWordService.meanWord(word);
        String[] lineMean = meanWord.split("\n");
        ArrayList<Word> wordList = searchWordService.listNearWord(word);

        model.addAttribute("mean", lineMean);
        model.addAttribute("wordListNear", wordList);
        if (lineMean != null)
            return "dictionary/mean";
        return "";
    }

    @RequestMapping(value = "/searchword/listword", method = RequestMethod.GET, produces="application/json")
    public @ResponseBody String findListSimilarWord(@RequestParam String word) {
        SearchWordService searchWordService = new SearchWordService();

        ArrayList<Word> wordList = searchWordService.listNearWord(word);

        Gson gson = new Gson();
        String json = gson.toJson(wordList);

        return json;
    }
}
