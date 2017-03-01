package com.dictionary.controllers;

import com.google.gson.Gson;
import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/kfc/brands")
public class JSONController {

	@RequestMapping(value = "{name}", method = RequestMethod.GET, produces="application/json")
	public @ResponseBody
	String getShopInJSON(@PathVariable String name) {

		Shop shop = new Shop();
		shop.setName(name);
		shop.setStaffName(new String[] { "mkyong1", "mkyong2" });

		ArrayList<Shop> shopList = new ArrayList<>();
		shopList.add(shop);
		shopList.add(shop);
//		shopList.add("Hello");
//		shopList.add("Chao");
//
//		JSONArray ajax = new JSONArray(shopList);
		Gson gson = new Gson();
		String json = gson.toJson(shopList);

		return json;
	}

}