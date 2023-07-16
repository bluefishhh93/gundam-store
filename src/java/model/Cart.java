/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author xuant
 */
public class Cart {

    private ArrayList<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public ArrayList<Item> getItems() {
        return items;
    }

    public void setItems(ArrayList<Item> items) {
        this.items = items;
    }

    public int getQuantityById(int id) {
        return getItemById(id).getQuantity();
    }

    private Item getItemById(int id) {
        for (Item i : items) {
            if (i.getProduct().getID() == id) {
                return i;
            }
        }
        return null;
    }

    //adding item into cart
    public void addItem(Item t) {
        //if this item exist in cart
        if (getItemById(t.getProduct().getID()) != null) {
            Item i = getItemById(t.getProduct().getID());
            i.setQuantity(i.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }

    public void removeItem(int id) {
        if (getItemById(id) != null) {
            items.remove(getItemById(id));
        }
    }

    public double getTotalMoney() {
        double totalMoney = 0;
        for (Item i : items) {
            totalMoney += i.getQuantity() * i.getPrice();
        }
        return totalMoney;
    }
}
