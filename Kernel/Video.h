#ifndef VIDEO_H
#define VIDEO_H     //so we don't get multiple definitions of VIdeo

class Video
{
public:
    Video();
    ~Video();
    void clear();
    void write(char *cp);
    void put(char c);
private:
    unsigned short *videomem;   //pointer to video memory
    unsigned int off;           //offset, used like a y cord
    unsigned int pos;           //position, used like x cord

}; //don't forget the semicolon!

#endif