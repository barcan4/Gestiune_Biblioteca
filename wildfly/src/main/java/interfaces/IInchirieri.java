package interfaces;

import entities.Inchirieri;

public interface IInchirieri {
    Inchirieri rent(int uID, int cID);
    Inchirieri returnC(int uID, int cID);
}
