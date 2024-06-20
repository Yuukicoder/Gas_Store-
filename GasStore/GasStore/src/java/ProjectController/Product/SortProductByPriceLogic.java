package ProjectController.Product;

import DTO.Product;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

public class SortProductByPriceLogic {
    public List<Product> sortPrice(List<Product> list, String mode) {
        if ("Descending".equalsIgnoreCase(mode)) {
            Collections.sort(list, new Comparator<Product>() {
                @Override
                public int compare(Product p1, Product p2) {
                    return Double.compare(p2.getUnitPrice(), p1.getUnitPrice());
                }
            });
        } else if ("Ascending".equalsIgnoreCase(mode)) {
            Collections.sort(list, new Comparator<Product>() {
                @Override
                public int compare(Product p1, Product p2) {
                    return Double.compare(p1.getUnitPrice(), p2.getUnitPrice());
                }
            });
        }
        return list;
    }

    public List<Product> filterByPrice(List<Product> list, double p) {
        List<Product> filteredList = new ArrayList<>();

        for (Product i : list) {
            if (i.getUnitPrice() >= (p - 100) && i.getUnitPrice() <= p) {
                filteredList.add(i);
            }
        }

        return filteredList;
    }
}
