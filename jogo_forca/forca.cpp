#include "forca.h"
#include <iostream>
#include <string>
#include <map>
#include <vector>
#include <fstream>
#include <ctime>
#include <cstdlib>
#include <QFile>
#include <QFileInfo>
#include<QTextStream>
#include<QDebug>


forca::forca(QObject *parent)
    : QObject{parent}
{

}

void forca::le_arquivo(){

    QFile file;

    QStringList palavras;
    file.setFileName(":/Lista/palavras.txt");

    if (file.open(QIODevice::ReadOnly)){
        QTextStream arquivo(&file);
        QString lines;

        lines = arquivo.readAll();
        palavras=lines.split("\n");

        file.close();
        this->sorteia(palavras);
    }




    /*std::ifstream arquivo;
    arquivo.open("qrc:/Lista/palavras.txt");

    if(arquivo.is_open()){
        int quantidade_palavras;
        arquivo >> quantidade_palavras;


        std::vector<std::string> palavras_do_arquivo;

        for(int i=0;i<quantidade_palavras;i++){
            std::string palavra_lida;
            arquivo >> palavra_lida;
            palavras_do_arquivo.push_back(palavra_lida);
        }

        arquivo.close();
        return palavras_do_arquivo;
    }
    else{
       exit(0);
    }*/
}

void forca::setM_palavra(QString new_word)
{
    if(new_word== __m_palavra__)
        return;
    __m_palavra__ = new_word;
    emit m_palavraChanged();
}

QString forca::m_palavra()
{
    return this->__m_palavra__;
}

void forca::sorteia(QStringList palavras)
{

    QString palavra_secreta = "";
    srand(time(NULL));
    int indice_sorteado = rand() % palavras.size();

    palavra_secreta = palavras[indice_sorteado];
    this->setM_palavra(palavra_secreta);
    qInfo() << palavra_secreta;

}
