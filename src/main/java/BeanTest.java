import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BeanTest {
    public static void main(String[] args) {
        List<Album> albums = new ArrayList<>();

        Album album1 = new Album(1, "Brand New", "Limousine", new Date(), 1000, "Rock");
        albums.add(album1);

        Album album2 = new Album(2, "Thursday", "War All The Time", new Date(), 2000, "Rock");
        albums.add(album2);

        for (Album album : albums) {
            System.out.println("Details: " + album.getArtist() + album.getName() + album.getSales() + album.getGenre());
        }
    }
}
