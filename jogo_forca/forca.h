#ifndef FORCA_H
#define FORCA_H

#include <QObject>
#include <QDebug>
#include <QVariant>

class forca : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString m_palavra READ m_palavra NOTIFY m_palavraChanged)
public:
    explicit forca(QObject *parent = nullptr);

    void setM_palavra(QString new_word);

    QString m_palavra();


private:
    QString __m_palavra__ = "";




signals:
    void status(QVariant data);
    void m_palavraChanged();

public slots:

void sorteia (QStringList palavras);
 void le_arquivo();

};

#endif // FORCA_H
