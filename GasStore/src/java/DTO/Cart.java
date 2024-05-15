/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DTO;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

/**
 *
 * @author msi
 */
public class Cart {

    private List<ItemDTO> items;

    public Cart() {
    }

    public Cart(List<ItemDTO> items) {
        this.items = items;
    }

    public List<ItemDTO> getItems() {
        return items;
    }

    public void setItems(List<ItemDTO> items) {
        this.items = items;
    }

    public int getQuantityById(int id) {
        return getItembyId(id).getQuantity();
    }

    private ItemDTO getItembyId(int id) {
        for (ItemDTO i : items) {
            if (i.getProduct().getProductID() == id) {
                return i;
            }
        }
        return null;
    }

    public void addItem(ItemDTO t) {
        if (getItembyId(t.getProduct().getProductID()) != null) {
            ItemDTO m = getItembyId(t.getProduct().getProductID());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        } else {
            items.add(t);
        }
    }
    
    public void changeQuantity(int productId, int quantity) throws Throwable {
        if (quantity == 0) {
            return;
        }
        
        ItemDTO selectedItem = this.items.stream()
                .filter(i -> i.getProduct().getProductID() == productId)
                .findFirst()
                .orElseThrow(() -> { throw new NoSuchElementException(); });
        int selectedItemIndex = items.indexOf(selectedItem);
        int newQuantity = selectedItem.getQuantity() + quantity;
        
        if (newQuantity < 1) {
              this.removeItem(productId);
        } else {
            selectedItem.setQuantity(newQuantity);
            items.set(selectedItemIndex, selectedItem);
        }
    }

    public void removeItem(int id) {
        if (getItembyId(id) != null) {
            items.remove(getItembyId(id));
        }
    }

    public double getTotalMoney() {
        double t = 0;
        for (ItemDTO i : items) {
            t += (i.getQuantity() * i.getProduct().getPrice());
        }
        return t;
    }

    private ProductDTO getProductById(int id, List<ProductDTO> list) {
        for (ProductDTO i : list) {
            if (i.getProductID() == id) {
                return i;
            }
        }
        return null;
    }

    public Cart(String savedStringFromCookie, List<ProductDTO> list) {
        items = new ArrayList<>();
        try {
            if (savedStringFromCookie != null && savedStringFromCookie.length() != 0) {
                String[] s = savedStringFromCookie.split("/");//thay / cho dau ,
                for (String i : s) {
                    String[] n = i.split(":");
                    int id = Integer.parseInt(n[0]);
                    int quantity = Integer.parseInt(n[1]);
                    ProductDTO p = getProductById(id, list);
                    ItemDTO t = new ItemDTO(p, quantity, p.getPrice() * 2);
                    addItem(t);
                }
            }
        } catch (NumberFormatException e) {

        }
    }
}
