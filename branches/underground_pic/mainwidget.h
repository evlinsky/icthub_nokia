#ifndef MAINWIDGET_H
#define MAINWIDGET_H

#include <QDeclarativeItem>
#include <QPainter>
#include <QFont>
#include <QPointF>
#include "apptypes.h"
#include "appdata.h"

class MainWidget : public QDeclarativeItem
{
    Q_OBJECT
    Q_PROPERTY(double scale READ scale WRITE setScale NOTIFY scaleChanged)
    Q_PROPERTY(qreal opacity READ opacity WRITE setOpacity NOTIFY opacityChanged)
    Q_PROPERTY(int x READ x WRITE setX NOTIFY xChanged)
    Q_PROPERTY(int y READ y WRITE setY NOTIFY yChanged)
    Q_PROPERTY(int width READ width WRITE setWidth NOTIFY widthChanged)
    Q_PROPERTY(int height READ height WRITE setHeight NOTIFY heightChanged)
    Q_PROPERTY(int xmlWidth READ xmlWidth WRITE setXmlWidth NOTIFY xmlWidthChanged)
    Q_PROPERTY(int xmlHeight READ xmlHeight WRITE setXmlHeight)
    Q_PROPERTY(QVariantList allEdges READ allEdges WRITE setAllEdges)
    Q_PROPERTY(QVariantList allStations READ allStations WRITE setAllStations)
    Q_PROPERTY(int parentWidth READ parentWidth WRITE setParentWidth NOTIFY parentWidthChanged)
    Q_PROPERTY(int parentHeight READ parentHeight WRITE setParentHeight)
    Q_PROPERTY(int penWidth READ penWidth WRITE setPenWidth)
    Q_PROPERTY(int circleSize READ circleSize WRITE setCircleSize)



public:
    MainWidget(QDeclarativeItem *parent = 0) :
        QDeclarativeItem(parent), m_x(0), m_y(0), m_width(0), m_height(0),m_img(),m_flag(0),m_fragments(0)
    {
        // Important, otherwise the paint method is never called
        setFlag(QGraphicsItem::ItemHasNoContents, false);
        setFlag(QGraphicsItem::ItemIsMovable, true);
        m_opacity = 1;

        if(m_img.load("qml/Underground/Icons/moscow_v3.1_w_text_full_color.png","PNG"))
            qDebug() << m_img.height() << " " << m_img.width();
        //setCacheMode(QGraphicsItem::DeviceCoordinateCache);
        //setBaselineOffset(-1000);
    }


    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
    {
        //qDebug() << "paint " << m_x;
        //QPainterPath path;
        QRectF curRect = boundingRect ();
        painter->setRenderHint(QPainter::SmoothPixmapTransform);
        painter->fillRect(curRect,QColor("White"));



        //painter->setRenderHint(QPainter::Antialiasing);
        //painter->setBrush(Qt::red);

        //painter->drawRect(m_x, m_y, m_width, m_height);
        double coef = (double)m_parentWidth * m_scale / m_xmlWidth;
        //m_coef = (double)m_parentWidth * m_scale / m_xmlWidth;
        //qDebug() << coef;
        setWidth(m_xmlWidth * coef);
        setHeight(m_xmlHeight * coef);
        //qDebug() << "width height coef:" << m_width << " " << m_height << " " << coef;

        //painter->drawImage(QRect(0,0,m_xmlWidth * coef,m_xmlHeight * coef), m_img);


        //qDebug() << "paint " << curRect.x() << " " << curRect.y() << " " <<curRect.width() << " " <<curRect.height();
        //drawNinePartImage(m_img, curRect, m_width/3, m_width/3, m_height/3,m_height/3,painter);
        if(m_flag == 0){
            drawNPartImage(m_img,curRect,10,painter);
            m_flag = 1;
        }else{
            painter->drawPixmapFragments(m_fragments, m_N*m_N,m_bg,QPainter::OpaqueHint);
        }
        //painter->drawImage(QRect(m_x,m_y,m_xmlWidth * coef,m_xmlHeight * coef),m_img,QRect(m_x,m_y,m_xmlWidth,m_xmlHeight));




        //qDebug() << "width ";

        /*for (int i = 0; i < m_allEdges.count(); ++i) {
            QVariantMap map = m_allEdges.at(i).toMap();
            if(curRect.contains((map["x1"].toInt())*coef,(map["y1"].toInt())*coef) ||
                    curRect.contains((map["x2"].toInt())*coef,(map["y2"].toInt())*coef)){
                if (map["byLegs"].toInt())
                    continue;
                QPen pen(QColor(map["color"].toString()), m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
                painter->setPen(pen);
                painter->setOpacity(m_opacity);
                if (map["x3"].toInt() != -1) {
                    if (map["x4"].toInt() != -1) {
                        painter->drawLine(map["x1"].toInt()*coef, map["y1"].toInt()*coef, map["x3"].toInt()*coef, map["y3"].toInt()*coef);
                        painter->drawLine(map["x3"].toInt()*coef, map["y3"].toInt()*coef, map["x4"].toInt()*coef, map["y4"].toInt()*coef);
                        painter->drawLine(map["x4"].toInt()*coef, map["y4"].toInt()*coef, map["x2"].toInt()*coef, map["y2"].toInt()*coef);
                    }
                    else {
                        painter->drawLine(map["x1"].toInt()*coef, map["y1"].toInt()*coef, map["x3"].toInt()*coef, map["y3"].toInt()*coef);
                        painter->drawLine(map["x3"].toInt()*coef, map["y3"].toInt()*coef, map["x2"].toInt()*coef, map["y2"].toInt()*coef);
                    }
                }
                else
                    painter->drawLine(map["x1"].toInt()*coef, map["y1"].toInt()*coef, map["x2"].toInt()*coef, map["y2"].toInt()*coef);
            }
        }
        for (int i = 0; i < m_allStations.count(); ++i) {
            QVariantMap map = m_allStations.at(i).toMap();
            if(curRect.contains((map["xCenter"].toInt() - m_cirlceSize/2)*coef,(map["yCenter"].toInt() - m_cirlceSize/2)*coef)){

                //painter->setBrush((QColor)map["stationColor"].toString());
                //qDebug() << map["xCenter"].toInt();
                painter->setPen(Qt::NoPen);
                painter->setBrush((QColor)map["stationColor"].toString());
                painter->setOpacity(m_opacity);
                painter->drawEllipse((map["xCenter"].toInt() - m_cirlceSize/2)*coef, (map["yCenter"].toInt() - m_cirlceSize/2)*coef,
                                     m_cirlceSize*coef, m_cirlceSize*coef);
            }
        }*/

        /*for (int i = 0; i < m_allStations.count(); ++i) {
            QVariantMap map = m_allStations.at(i).toMap();
            if(curRect.contains(map["x"].toInt()*coef,map["y"].toInt()*coef)){

                QPen pen(QColor(map["stationColor"].toString()), m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
                painter->setPen(pen);
                QFont font( "Arial");
                font.setPixelSize(2*m_penWidth*coef);
                painter->setFont(font);
                painter->setOpacity(m_opacity);
                painter->drawStaticText ( map["x"].toInt()*coef, map["y"].toInt()*coef, QStaticText(map["name"].toString()));
            }
        }*/




        /*int x = qMin(m_x1, m_x2) - m_penWidth/2;
        int y = qMin(m_y1, m_y2) - m_penWidth/2;

        QPointF middle1( (m_x1 + m_x2)/2 - x, (m_y1 + m_y2)/2 - y );
        //QPointF middle2( 3*(m_x1 + m_x2)/4, (m_y1 + m_y2)/2 );



        path.moveTo(m_x1 - x,m_y1 - y);
        //path.cubicTo( middle1.x(), middle1.y(),
        //              middle2.x(), middle2.y(),
        //              m_x2, m_y2 );
        path.quadTo( middle1.x(), middle1.y(),m_x2 - x,m_y2 - y);
        QPen qpen(m_color, m_penWidth);// = new QPen(m_color, m_penWidth);
        qpen.setCapStyle(Qt::RoundCap);
        painter->strokePath( path, qpen);

        //    painter->setPen( QPen(Qt::red) );
        //    painter->drawRect( path.boundingRect().normalized()  );
        /*QPen pen(m_color, m_penWidth);
        painter->setPen(pen);

        if(smooth() == true) {
            painter->setRenderHint(QPainter::Antialiasing, true);
        }

        int x = qMin(m_x1, m_x2) - m_penWidth/2;
        int y = qMin(m_y1, m_y2) - m_penWidth/2;

        painter->drawLine(m_x1 - x, m_y1 - y, m_x2 - x, m_y2 - y);*/
    }
    void drawNinePartImage(const QImage &image, QRectF paintRect, qreal borderLeft, qreal borderRight, qreal borderTop, qreal borderBottom, QPainter * painter)
    {
        QPixmap bg = QPixmap::fromImage(image);
        qreal sx = 1.0 * m_width / bg.width() , sy = bg.height()/ paintRect.height();
        sy = sx;
        borderLeft *= sx;
        borderRight *= sx;
        borderTop *= sx;
        borderBottom *= sx;
        // source size
        qreal w = bg.width();
        qreal h = bg.height();
        // target size
        qreal tw = paintRect.width();
        qreal th = paintRect.height();
        /*

    +-------+-------------------+-------+
    |       |                   |       |
    |   0   |         1         |   2   |
    |       |                   |       |
    +-------+-------------------+-------+
    |       |                   |       |
    |   3   |         4         |   5   |
    |       |                   |       |
    +-------+-------------------+-------+
    |       |                   |       |
    |   6   |         7         |   8   |
    |       |                   |       |
    +-------+-------------------+-------+

    */
        QPainter::PixmapFragment fragments[9]; // we'll draw 9-part pixmap
        qreal hborders = (borderLeft + borderRight)*sx;
        qreal vborders = (borderTop + borderBottom)*sx;

        //qDebug() << "scale " << sx << " " << sy;
        qDebug() << "border hor " << borderLeft << " " << borderRight;
        qDebug() << "border ver " << borderTop<< " " << borderBottom;
        qreal hbLeft = borderLeft*sx / (2.0);
        qreal hbRight = borderRight*sx / (2.0);
        qreal hbTop = borderTop*sx / (2.0);
        qreal hbBottom = borderBottom*sx /(2.0);

        //qDebug() << "hbLeft " << hbLeft << " " << hbRight;
        // qDebug() << "hbTop " << hbTop << " " << hbBottom;

        qDebug() << "0" << hbLeft << " " << hbTop;
        qDebug() << "1" << borderLeft*sx + (tw - hborders) / 2.0 << " " << hbTop;
        qDebug() << "2" << tw - hbRight << " " << hbTop;
        qDebug() << "3" << hbLeft << " " << borderTop*sx + (th - hborders) / 2.0;
        qDebug() << "4" << borderLeft*sx + (tw - hborders) / 2.0 << " " << borderTop*sx + (th - vborders) / 2.0;
        qDebug() << "5" << tw - hbRight << " " << borderTop*sx + (th - vborders) / 2.0;
        qDebug() << "6" << hbLeft << " " << th - hbBottom;
        qDebug() << "7" << (borderLeft*sx + (tw - hborders) / 2.0) << " " << th - hbBottom;
        qDebug() << "8" << tw - hbRight << " " << th - hbBottom;




        fragments[0] = QPainter::PixmapFragment::create(QPointF(hbLeft, hbTop),
                                                        QRectF(0, 0, borderLeft, borderTop),sx,sy);
        fragments[1] = QPainter::PixmapFragment::create(QPointF(borderLeft*sx + (tw - hborders) / 2.0, hbTop),
                                                        QRectF(borderLeft, 0, w - hborders/sx, borderTop),sx,sy);
        fragments[2] = QPainter::PixmapFragment::create(QPointF(tw - hbRight, hbTop),
                                                        QRectF(w - borderRight, 0, borderRight, borderTop),sx,sy);
        fragments[3] = QPainter::PixmapFragment::create(QPointF(hbLeft, borderTop*sx + (th - hborders) / 2.0),
                                                        QRectF(0, borderTop, borderLeft, h - hborders/sx), sx,sy);
        fragments[4] = QPainter::PixmapFragment::create(QPointF(borderLeft*sx + (tw - hborders) / 2.0, borderTop*sx + (th - vborders) / 2.0),
                                                        QRectF(borderLeft, borderTop, w - hborders/sx, h - vborders/sx),sx,sy);
        fragments[5] = QPainter::PixmapFragment::create(QPointF(tw - hbRight, borderTop*sx + (th - vborders) / 2.0),
                                                        QRectF(w - borderRight, borderTop, borderRight, h - vborders/sx),sx,sy);
        fragments[6] = QPainter::PixmapFragment::create(QPointF(hbLeft, th - hbBottom),
                                                        QRectF(0, h - borderBottom, borderLeft, borderBottom),sx,sy);
        fragments[7] = QPainter::PixmapFragment::create(QPointF(borderLeft*sx + (tw - hborders) / 2.0, th - hbBottom),
                                                        QRectF(borderLeft, h - borderBottom, w - hborders/sx, borderBottom),sx,sy);
        fragments[8] = QPainter::PixmapFragment::create(QPointF(tw - hbRight, th - hbBottom),
                                                        QRectF(w - borderRight, h - borderBottom, borderRight, borderBottom),sx,sy);

        painter->drawPixmapFragments(fragments, 9, bg);
    }

    void drawNPartImage(const QImage &image, QRectF paintRect, int N, QPainter * painter)
    {
        m_bg = QPixmap::fromImage(image);
        qreal sx = 1.0 * m_width / m_bg.width();
        //qreal sy = 1.0 * m_height / m_bg.height();
        qreal sy = sx;
        //qDebug() << m_width << " " <<m_height;
        qreal horSpace = 1.0*m_width / N;
        qreal verSpace = 1.0*m_width / N;
        qreal horImageSpace = horSpace/sx;
        qreal verImageSpace = verSpace/sy;
        //horSpace *= sx;
        //verSpace *= sx;
        // source size
        qreal w = m_bg.width();
        qreal h = m_bg.height();
        // target size
        qreal tw = paintRect.width();
        qreal th = paintRect.height();

        QPainter::PixmapFragment* fragments = new QPainter::PixmapFragment[N*N];
        //qDebug() << sx << " " << sy;
        for(int i = 0; i < N ;i++){
            for(int j = 0; j < N; j++){
                //qDebug() << i << " " << j << " - " << horSpace*i + horSpace/2.0 << " " << verSpace*j + verSpace/2.0 << " " << horImageSpace*i << " " << verImageSpace*j << " " << horImageSpace*(i+1) << " " << verImageSpace*(j+1);
                fragments[i*N + j] = QPainter::PixmapFragment::create(QPointF(horSpace*i + horSpace/2.0, verSpace*j + verSpace/2.0),
                                                                      QRectF(horImageSpace*i, verImageSpace*j, horImageSpace, verImageSpace),sx,sx);
            }
        }




        m_N = N;

        painter->drawPixmapFragments(fragments, N*N, m_bg);
        m_fragments = fragments;
    }
    void recountScale(){
        if(m_fragments == 0){
            return;
        }
        //qreal sx = (1.0 * m_width / m_bg.width())*0.9;
        qreal sx = (1.0 * m_width / m_bg.width());
        qreal horSpace = 1.0*m_width / m_N;
        qreal verSpace = 1.0*m_width / m_N;

        QRectF observer = boundingRect();

        for(int i = 0; i < m_N ;i++){
            for(int j = 0; j < m_N ;j++){
                //qDebug() << i*m_N + j;
                //if(observer.contains(QRectF(horSpace*i,verSpace*j,horSpace,verSpace)))
                m_fragments[i*m_N + j].scaleX = sx;
                m_fragments[i*m_N + j].scaleY = sx;
                m_fragments[i*m_N + j].x= horSpace*i + horSpace/2.0;
                m_fragments[i*m_N + j].y = verSpace*j + verSpace/2.0;
            }
        }

    }

    QRectF boundingRect () const {
        //return QRectF(-m_parentWidth, -m_parentHeight, 3*m_parentWidth, 3*m_parentHeight);
        //qDebug() << "boundingRect " << m_x;
        return QRectF(m_x, m_y, m_parentWidth, m_parentHeight);
    }

    // Get methods
    int x() const { return m_x; }
    int y() const { return m_y; }
    int width() const { return m_width; }
    int height() const { return m_height; }
    int xmlWidth() const { return m_xmlWidth; }
    int xmlHeight() const { return m_xmlHeight; }
    QVariantList allEdges() const { return m_allEdges; }
    QVariantList allStations() const { return m_allStations; }
    int parentWidth() const { return m_parentWidth; }
    int parentHeight() const { return m_parentHeight; }
    int penWidth() const { return m_penWidth; }
    int circleSize() const { return m_cirlceSize; }
    qreal opacity() const { return m_opacity; }
    double scale() const { return m_scale; }


    // Set methods
    void setX(int x) {
        //qDebug() << "setX " << x;
        if(m_x == x) return;
        m_x = x;
        emit xChanged();
        update();
    }

    void setY(int y) {
        if(m_y == y) return;
        m_y = y;
        emit yChanged();
        update();
    }

    void setWidth(int width) {
        if(m_width == width) return;
        m_width = width;
        recountScale();
        updateSize();
        emit widthChanged();
        update();
    }

    void setHeight(int height) {
        if(m_height == height) return;
        m_height = height;
        updateSize();
        emit heightChanged();
        update();
    }

    void setXmlWidth(int xmlWidth) {
        m_xmlWidth = xmlWidth;
        emit xmlWidthChanged();
        update();
    }

    void setXmlHeight(int xmlHeight) {
        m_xmlHeight = xmlHeight;
        update();
    }

    void setAllEdges(QVariantList allEdges){
        m_allEdges = allEdges;
        update();
    }

    void setAllStations(QVariantList allStations){
        m_allStations = allStations;
        update();
    }

    void setParentWidth(int parentWidth) {
        m_parentWidth = parentWidth;
        emit parentWidthChanged();
    }

    void setParentHeight(int parentHeight) {
        m_parentHeight = parentHeight;
    }

    void setPenWidth(int newWidth) {
        m_penWidth = newWidth;
        update();
    }
    void setOpacity(qreal newOpacity) {
        m_opacity = newOpacity;
        emit opacityChanged();
        update();
    }

    void setCircleSize(int newSize) {
        m_cirlceSize = newSize;
        update();
    }

    void setScale(double newScale) {
        if(m_scale == newScale) return;
        m_scale = newScale;
        emit scaleChanged();

        update();
    }
    Q_INVOKABLE double getCoef(){
        return ((double)m_parentWidth * m_scale / m_xmlWidth);
    }


signals:
    void xChanged();
    void yChanged();
    void widthChanged();
    void heightChanged();
    void scaleChanged();
    void opacityChanged();
    void xmlWidthChanged();
    void parentWidthChanged();

protected:
    void updateSize() {
        /*setX(qMin(m_x1, m_x2) - m_penWidth/2);
        setY(qMin(m_y1, m_y2) - m_penWidth/2);
        setWidth(qAbs(m_x2 - m_x1) + m_penWidth);
        setHeight(qAbs(m_y2 - m_y1) + m_penWidth);*/
    }

protected:
    int m_x;
    int m_y;
    int m_width;
    int m_height;
    int m_xmlWidth;
    int m_xmlHeight;
    int m_parentHeight;
    int m_parentWidth;
    int m_penWidth;
    int m_cirlceSize;
    int m_N;
    QPainter::PixmapFragment* m_fragments;
    QPixmap m_bg;
    double m_scale;
    double m_coef;
    int m_flag;
    QImage m_img;
    qreal m_opacity;
    QVariantList m_allEdges;
    QVariantList m_allStations;
};

QML_DECLARE_TYPE(MainWidget)


#endif // MAINWIDGET_H
