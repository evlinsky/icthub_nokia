#include <QDeclarativeItem>
#include <QPainter>
#include <QFont>
#include <QPointF>
#include "apptypes.h"
#include "appdata.h"
#include "mainwidget.h"
#include <QX11Info>

MainWidget::MainWidget(QDeclarativeItem *parent) :
    QDeclarativeItem(parent), m_x(0), m_y(0), m_width(0), m_height(0)
{
    // Important, otherwise the paint method is never called
    setFlag(QGraphicsItem::ItemHasNoContents, false);
    setFlag(QGraphicsItem::ItemIsMovable, true);
    m_opacity = 1;
    m_paintEnabled = false;
    init = true;
    m_showRoute = false;
    m_repaint = false;
    m_fast = false;
    m_oldPixmap = 0;
    m_smallPixmap = 0;
    m_firstScale = 1.5;
    //update();
    //setCacheMode(QGraphicsItem::);
    //setBaselineOffset(-1000);
}

void MainWidget::createPixmap() {
    if (!m_paintEnabled)
        return;

    if (m_smallPixmap == 0) {
        //qDebug() << "createPixmap " << m_firstScale;
        m_scale = m_firstScale;
    }

    double coef = (double)m_parentWidth * m_scale / m_xmlWidth;
    setWidth(m_xmlWidth * coef);
    setHeight(m_xmlHeight * coef);
    //qDebug() << m_width;

    if (!init)
        m_pixmap->~QPixmap();
    m_pixmap = new QPixmap(m_width, m_height);
    //qDebug() << m_pixmap->x11Info().appDefaultColormap();
    //qDebug() << m_pixmap->logicalDpiX();
    QPainter* painter = new QPainter(m_pixmap);
    painter->fillRect(m_pixmap->rect(), Qt::white);

#ifdef Q_OS_LINUX
    painter->setRenderHint(QPainter::Antialiasing);
#endif
    //painter->setRenderHint(QPainter::Antialiasing);

    m_opacity = 1.0;
    if (m_showRoute) {
        m_opacity = 0.3;
        painter->setOpacity(m_opacity);
    }

    for (int i = 0; i < m_allEdges.count(); ++i) {
        QVariantMap map = m_allEdges.at(i).toMap();
            if (map["byLegs"].toInt())
                continue;
            /*bool cont = false;
            if (m_showRoute) {
                for (int i1 = 0; i1< m_routeEdges.count(); ++i1) {
                    if (m_routeEdges.at(i1).toMap()["id"].toInt() == map["id"].toInt()) {
                        cont = true;
                        break;
                    }
                }
            }
            if (cont)
                continue;*/
            QPen pen(QColor(map["color"].toString()), m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
            painter->setPen(pen);
            if (map["x3"].toInt() != -1) {
                if (map["x4"].toInt() != -1) {
                    painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef));
                    if (m_showRoute) {
                        painter->setOpacity(1);
                        painter->setPen(QPen(Qt::white, m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
                        painter->drawPoint(QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef));
                        painter->setPen(QPen(QColor(map["color"].toString()), m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
                        painter->setOpacity(m_opacity);
                    }
                    painter->drawLine(QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef), QPointF((qreal)map["x4"].toInt()*coef, (qreal)map["y4"].toInt()*coef));
                    if (m_showRoute) {
                        painter->setOpacity(1);
                        painter->setPen(QPen(Qt::white, m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
                        painter->drawPoint(QPointF((qreal)map["x4"].toInt()*coef, (qreal)map["y4"].toInt()*coef));
                        painter->setPen(QPen(QColor(map["color"].toString()), m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
                        painter->setOpacity(m_opacity);
                    }
                    painter->drawLine(QPointF((qreal)map["x4"].toInt()*coef, (qreal)map["y4"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
                }
                else {
                    painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef));
                    if (m_showRoute) {
                        painter->setOpacity(1);
                        painter->setPen(QPen(Qt::white, m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
                        painter->drawPoint(QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef));
                        painter->setPen(QPen(QColor(map["color"].toString()), m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
                        painter->setOpacity(m_opacity);
                    }
                    painter->drawLine(QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
                }
            }
            else
                painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
    }
    if (m_showRoute) {
        painter->setPen(Qt::NoPen);
        painter->setBrush(Qt::white);
        //painter->setOpacity(0.7);
        //painter->fillRect(m_pixmap->rect(), Qt::white);
        painter->setOpacity(1);

        for (int i = 0; i < m_routeEdges.count(); ++i) {
            QVariantMap map = m_routeEdges.at(i).toMap();
                if (map["byLegs"].toInt())
                    continue;
                QPen pen(QColor(map["color"].toString()), m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
                painter->setPen(pen);
                if (map["x3"].toInt() != -1) {
                    if (map["x4"].toInt() != -1) {
                        painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef));
                        painter->drawLine(QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef), QPointF((qreal)map["x4"].toInt()*coef, (qreal)map["y4"].toInt()*coef));
                        painter->drawLine(QPointF((qreal)map["x4"].toInt()*coef, (qreal)map["y4"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
                    }
                    else {
                        painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef));
                        painter->drawLine(QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
                    }
                }
                else
                    painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
        }
    }
    painter->setOpacity(m_opacity);
    QPen pen2(Qt::black, (qreal)m_penWidth/2.5*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
    painter->setPen(QPen(Qt::black, (qreal)m_penWidth/2.5*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
    painter->setBrush(Qt::white);
    for (int i = 0; i < m_rects.count(); ++i) {
        QVariantMap map = m_rects.at(i).toMap();
        painter->rotate(-map["rotation"].toInt());
        if (m_showRoute) {
            /*if ((m_showRoute)&&(map["x"].toInt()==788)&&(map["y"]==4200)) {
                painter->setOpacity(1);
                painter->fillRect(QRectF((qreal)(map["x"].toInt() - m_cirlceSize*0.65)*coef, (qreal)map["y"].toInt()*coef, (qreal)m_cirlceSize*coef*1.3, (qreal)map["height"].toInt()*coef), Qt::white);
                painter->setOpacity(m_opacity);
            }*/
            painter->setOpacity(1);
            painter->drawRoundedRect (QRectF((qreal)(map["x"].toInt() - m_cirlceSize*0.65)*coef, (qreal)map["y"].toInt()*coef, (qreal)m_cirlceSize*coef*1.3, (qreal)map["height"].toInt()*coef),
                                      (qreal)m_cirlceSize*coef*0.65, (qreal)m_cirlceSize*coef*0.65);
            painter->setPen(QPen(Qt::white, (qreal)m_penWidth/2.5*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
            painter->setOpacity(1-m_opacity);
            painter->drawRoundedRect (QRectF((qreal)(map["x"].toInt() - m_cirlceSize*0.65)*coef, (qreal)map["y"].toInt()*coef, (qreal)m_cirlceSize*coef*1.3, (qreal)map["height"].toInt()*coef),
                                      (qreal)m_cirlceSize*coef*0.65, (qreal)m_cirlceSize*coef*0.65);
            painter->setPen(QPen(Qt::black, (qreal)m_penWidth/2.5*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin));
        }
        else
            painter->drawRoundedRect (QRectF((qreal)(map["x"].toInt() - m_cirlceSize*0.65)*coef, (qreal)map["y"].toInt()*coef, (qreal)m_cirlceSize*coef*1.3, (qreal)map["height"].toInt()*coef),
                                      (qreal)m_cirlceSize*coef*0.65, (qreal)m_cirlceSize*coef*0.65);
        painter->rotate(map["rotation"].toInt());
    }
    for (int i = 0; i < m_allStations.count(); ++i) {
        QVariantMap map = m_allStations.at(i).toMap();
        /*bool cont = false;
        if (m_showRoute) {
            for (int i1 = 0; i1< m_routeStations.count(); ++i1) {
                if (m_routeStations.at(i1).toMap()["id"].toInt() == map["id"].toInt()) {
                    cont = true;
                    break;
                }
            }
        }
        if (cont)
            continue;*/

            //painter->setBrush((QColor)map["stationColor"].toString());
            //qDebug() << map["xCenter"].toInt();
            painter->setPen(Qt::NoPen);
            if (m_showRoute) {
                painter->setBrush(Qt::white);
                painter->setOpacity(1);
                painter->drawEllipse(QPointF((qreal)map["xCenter"].toDouble()*coef, (qreal)map["yCenter"].toDouble()*coef),
                                     (qreal)m_cirlceSize*coef/2, (qreal)m_cirlceSize*coef/2);
                painter->setOpacity(m_opacity);
            }
            painter->setBrush((QColor)map["stationColor"].toString());
            painter->drawEllipse(QPointF((qreal)map["xCenter"].toDouble()*coef, (qreal)map["yCenter"].toDouble()*coef),
                                 (qreal)m_cirlceSize*coef/2, (qreal)m_cirlceSize*coef/2);
    }

    QPen pen(Qt::black, 1, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
    painter->setPen(pen);
    QFont font( "Arial");
    font.setPixelSize((qreal)1.6*m_penWidth*coef);
    painter->setFont(font);
    for (int i = 0; i < m_allStations.count(); ++i) {
        QVariantMap map = m_allStations.at(i).toMap();
        /*bool cont = false;
        if (m_showRoute) {
            for (int i1 = 0; i1< m_routeStations.count(); ++i1) {
                if (m_routeStations.at(i1).toMap()["id"].toInt() == map["id"].toInt()) {
                    cont = true;
                    break;
                }
            }
        }
        if (cont)
            continue;*/
//        painter->setOpacity(0.3);
//        painter->drawRect(QRectF((qreal)map["x"].toInt()*coef, (qreal)map["y"].toInt()*coef, (qreal)map["width"].toInt()*coef, (qreal)map["height"].toInt()*coef));
//        painter->setOpacity(1);
        painter->drawText (QRectF((qreal)map["x"].toInt()*coef, (qreal)map["y"].toInt()*coef, (qreal)map["width"].toInt()*coef, (qreal)map["height"].toInt()*coef), map["HAlign"].toInt()+map["VAlign"].toInt()+Qt::TextWordWrap, QString(map["name"].toString()));
    }

    /*if (m_showRoute) {
        painter->setOpacity(0.3);
        painter->fillRect(m_pixmap->rect(), Qt::white);
    }*/

    if (m_showRoute) {
        painter->setPen(Qt::NoPen);
        painter->setBrush(Qt::white);
        //painter->setOpacity(0.7);
        //painter->fillRect(m_pixmap->rect(), Qt::white);
        painter->setOpacity(1);

        /*for (int i = 0; i < m_routeEdges.count(); ++i) {
            QVariantMap map = m_routeEdges.at(i).toMap();
                if (map["byLegs"].toInt())
                    continue;
                QPen pen(QColor(map["color"].toString()), m_penWidth*coef, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
                painter->setPen(pen);
                if (map["x3"].toInt() != -1) {
                    if (map["x4"].toInt() != -1) {
                        painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef));
                        painter->drawLine(QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef), QPointF((qreal)map["x4"].toInt()*coef, (qreal)map["y4"].toInt()*coef));
                        painter->drawLine(QPointF((qreal)map["x4"].toInt()*coef, (qreal)map["y4"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
                    }
                    else {
                        painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef));
                        painter->drawLine(QPointF((qreal)map["x3"].toInt()*coef, (qreal)map["y3"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
                    }
                }
                else
                    painter->drawLine(QPointF((qreal)map["x1"].toInt()*coef, (qreal)map["y1"].toInt()*coef), QPointF((qreal)map["x2"].toInt()*coef, (qreal)map["y2"].toInt()*coef));
        }*/
        for (int i = 0; i < m_routeStations.count(); ++i) {
            QVariantMap map = m_routeStations.at(i).toMap();
                //painter->setBrush((QColor)map["stationColor"].toString());
                //qDebug() << map["xCenter"].toInt();
                painter->setPen(Qt::NoPen);
                painter->setBrush((QColor)map["stationColor"].toString());
                painter->drawEllipse(QPointF((qreal)map["xCenter"].toDouble()*coef, (qreal)map["yCenter"].toDouble()*coef),
                                     (qreal)m_cirlceSize*coef/2, (qreal)m_cirlceSize*coef/2);
                QPen pen(Qt::black, 1, Qt::SolidLine, Qt::RoundCap, Qt::RoundJoin);
                painter->setPen(pen);
                painter->drawText (QRectF((qreal)map["x"].toInt()*coef, (qreal)map["y"].toInt()*coef, (qreal)map["width"].toInt()*coef, (qreal)map["height"].toInt()*coef), map["HAlign"].toInt()+map["VAlign"].toInt()+Qt::TextWordWrap, QString(map["name"].toString()));
        }


    }
    //qDebug() << (double)m_width/m_parentWidth;
    painter->~QPainter();
    //m_widget->update();

    if (m_smallPixmap == 0) {
        m_smallPixmap = new QPixmap(m_width, m_height);
        painter = new QPainter(m_smallPixmap);
        painter->drawPixmap(m_pixmap->rect(), *m_pixmap, m_pixmap->rect());
        delete painter;
    }

    if (init) {
        m_scale = 1;
        init = false;
        createPixmap();
    }
}
void MainWidget::createFastRoutePixmap() {
    if ((!m_paintEnabled)||(init))
        return;
    qDebug() << "createFastRoutePixmap";
    QPainter* painter = new QPainter(m_pixmap);
    painter->setOpacity(0.7);
    painter->fillRect(boundingRect(), Qt::white);
    m_repaint = true;
    delete painter;
    m_widget->repaint();
}

void MainWidget::createFastPixmap() {
    double coef = (double)m_parentWidth * m_scale / m_xmlWidth;
    setWidth(m_xmlWidth * coef);
    setHeight(m_xmlHeight * coef);
    //qDebug() << m_width << " " << m_height;
    QPixmap* m_pixmap = new QPixmap(m_width, m_height);
    QPainter* painter = new QPainter(m_pixmap);
    painter->drawPixmap(m_pixmap->rect(), m_oldPixmap->scaled(m_width, m_height), m_oldPixmap->rect());
    delete painter;
    //qDebug() << "changed";
    //qDebug() << m_pixmap->width() << " " << m_pixmap->height();

    m_widget->repaint();
}


void MainWidget::createFastScaledPixmap() {
    if ((!m_paintEnabled)||(init))
        return;
    double coef = (double)m_parentWidth * m_newScale / m_xmlWidth;

    delete m_pixmap;

    oldX = m_x;
    oldY = m_y;

    setWidth(m_xmlWidth * coef);
    setHeight(m_xmlHeight * coef);
    m_pixmap = new QPixmap(m_width, m_height);


    double zoom = (double)m_width/m_smallPixmap->width();

    QPainter* painter = new QPainter(m_pixmap);

    QPainter::PixmapFragment fragment;
    fragment.height = qMin((qreal)m_smallPixmap->rect().height()-m_y/zoom, (qreal)m_parentHeight/zoom);
    fragment.width = qMin((qreal)m_smallPixmap->rect().width()-m_x/zoom, (qreal)m_parentWidth/zoom);
    fragment.sourceLeft = m_x/zoom;
    fragment.sourceTop = m_y/zoom;
    fragment.x = m_x+m_parentWidth/2;
    fragment.y = m_y + fragment.height/2*zoom;
    fragment.scaleX = zoom;
    fragment.scaleY = zoom;
    fragment.rotation = 0;
    fragment.opacity = m_opacity;

#ifndef Q_OS_SYMBIAN
    painter->fillRect(boundingRect(), QBrush(Qt::white));
#endif

    painter->drawPixmapFragments(&fragment,1, *m_smallPixmap, QPainter::OpaqueHint);

    delete painter;





    //painter->drawPixmap(boundingRect(), m_oldPixmap->scaled(m_xmlWidth*coef, m_xmlHeight*coef), QRectF());
    //QPainter* painter = new QPainter(m_pixmap);

    //m_repaint = true;
    //delete painter;
    m_widget->repaint();
    //init = false;
}

/*void MainWidget::createFastScaledPixmap() {
    if ((!m_paintEnabled)||(init))
        return;
    double coef = (double)m_parentWidth * m_newScale / m_xmlWidth;
    //qDebug() << m_width << " " << m_height;

    //painter->fillRect(m_pixmap->rect(), Qt::white);
    if (m_oldPixmap == 0) {
        m_oldPixmap = m_pixmap;
        oldX = m_x;
        oldY = m_y;
    }
    else
        delete m_pixmap;

    setWidth(m_xmlWidth * coef);
    setHeight(m_xmlHeight * coef);
    double zoom = (double)m_width/m_oldPixmap->width();
    //qDebug() << zoom;

    m_pixmap = new QPixmap(m_width, m_height);
    //QPainter* painter = new QPainter(m_pixmap);
    QPixmap* newPixmap = new QPixmap((qreal)m_parentWidth/zoom, (qreal)m_parentHeight/zoom);
    QPainter* painter = new QPainter(newPixmap);
    painter->drawPixmap(0,0,(qreal)m_parentWidth/zoom,(qreal)m_parentHeight/zoom,*m_oldPixmap,
                        (qreal)m_x/zoom,(qreal)m_y/zoom,(qreal)m_parentWidth/zoom,(qreal)m_parentHeight/zoom);
    delete painter;
    painter = new QPainter(m_pixmap);
    painter->drawPixmap(m_x,m_y,m_parentWidth,m_parentHeight,newPixmap->scaledToWidth(m_parentWidth),
                        0,0,(qreal)m_parentWidth,(qreal)m_parentHeight);
    delete painter;
    delete newPixmap;



    //painter->drawPixmap(boundingRect(), m_oldPixmap->scaled(m_xmlWidth*coef, m_xmlHeight*coef), QRectF());
    //QPainter* painter = new QPainter(m_pixmap);

    //m_repaint = true;
    //delete painter;
    m_widget->repaint();
    //init = false;
}*/

/*void MainWidget::createFastScaledPixmap() {
    if ((!m_paintEnabled)||(init))
        return;
    double coef = (double)m_parentWidth * m_newScale / m_xmlWidth;
    delete m_pixmap;

    setWidth(m_xmlWidth * coef);
    setHeight(m_xmlHeight * coef);
    //double zoom = (double)m_width/m_oldPixmap->width();
    //qDebug() << zoom;

    m_pixmap = new QPixmap(m_width, m_height);
    QPainter* painter = new QPainter(m_pixmap);
    painter->drawPixmap(boundingRect(),m_smallPixmap->scaledToWidth(m_width),
                        boundingRect());
    delete painter;

    m_widget->repaint();
}*/


/*void MainWidget::createFastScaledPixmap() {
    if ((!m_paintEnabled)||(init))
        return;
    double coef = (double)m_parentWidth * m_newScale / m_xmlWidth;
    setWidth(m_xmlWidth * coef);
    setHeight(m_xmlHeight * coef);
    //qDebug() << m_width << " " << m_height;

    //painter->fillRect(m_pixmap->rect(), Qt::white);
    delete m_pixmap;
    m_pixmap = new QPixmap(m_width, m_height);
    QPainter* painter = new QPainter(m_pixmap);
    painter->drawPixmap(m_pixmap->rect(),m_smallPixmap->scaledToWidth(m_width),m_pixmap->rect());
    delete painter;
    m_widget->repaint();

}*/


void MainWidget::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    if (!m_paintEnabled)
        return;
    m_widget = widget;
    //qDebug() << "paint";
    /*if (m_scale == m_oldScale) {
    }
    else {
        m_oldScale = m_scale;
        //qDebug() << "paint " << m_x;
   */     //QPainterPath path;

    QRectF curRect = boundingRect ();
    //QRect curRect;
    //curRect.setX(curRectF.x());
    //curRect.setY(curRectF.y());
    //curRect.setWidth(curRectF.width());
    //curRect.setHeight(curRectF.height());

    painter->fillRect(curRect,QColor("White"));
    painter->drawPixmap(curRect, *m_pixmap, curRect);

    //setRepaint(true);
    //qDebug() << m_pixmap->width() << m_width;
}

QRectF MainWidget::boundingRect () const {
    //return QRectF(-m_parentWidth, -m_parentHeight, 3*m_parentWidth, 3*m_parentHeight);
    //qDebug() << "boundingRect " << m_x;
    return QRectF(m_x, m_y, m_parentWidth, m_parentHeight);
}

void MainWidget::setX(int x) {
    if(m_x == x) return;
    m_x = x;
    emit xChanged();
}
void MainWidget::setY(int y) {
    if(m_y == y) return;
    m_y = y;
    emit yChanged();
}
void MainWidget::setWidth(int width) {
    if(m_width == width) return;
    m_width = width;
    updateSize();
    emit widthChanged();
}
void MainWidget::setHeight(int height) {
    if(m_height == height) return;
    m_height = height;
    updateSize();
    emit heightChanged();
}
void MainWidget::setAllEdges(QVariantList allEdges){
    m_allEdges = allEdges;
}
void MainWidget::setAllStations(QVariantList allStations){
    if (m_allStations == allStations)
        return;
    m_allStations = allStations;
    delete m_smallPixmap;
    m_smallPixmap = 0;
}
void MainWidget::setRouteEdges(QVariantList routeEdges){
    m_routeEdges = routeEdges;
}
void MainWidget::setRouteStations(QVariantList routeStations){
    m_routeStations = routeStations;
}
void MainWidget::setRects(QVariantList rects) {
    m_rects = rects;
}
void MainWidget::setParentWidth(int parentWidth) {
    m_parentWidth = parentWidth;
    emit parentWidthChanged();
}
void MainWidget::setParentHeight(int parentHeight) {
    m_parentHeight = parentHeight;
}
void MainWidget::setPenWidth(int newWidth) {
    m_penWidth = newWidth;
}
void MainWidget::setOpacity(qreal newOpacity) {
    m_opacity = newOpacity;
    emit opacityChanged();
}
void MainWidget::setCircleSize(int newSize) {
    m_cirlceSize = newSize;
}
void MainWidget::setRepaint(bool repaint) {
    //if (repaint == m_repaint)
      //  return;
    m_repaint = repaint;
    emit repaintChanged();
}
void MainWidget::setFast(bool fast) {
    if (m_fast == fast)
        return;
    m_fast = fast;
    /*if ((m_fast == false)&&(!init)) {
        delete m_oldPixmap;
        m_oldPixmap = 0;
    }*/
}
void MainWidget::setScale(double newScale) {
    //qDebug() << m_fast << " " << m_oldFast;
    if ((m_scale == newScale)&&((m_fast != false)&&(m_oldFast != true))) return;
    m_newScale = newScale;
    //qDebug() << "setScale";
    //createFastScaledPixmap();
    m_scale = newScale;
    emit scaleChanged();
    if (m_fast) {
        m_oldFast = m_fast;
        //qDebug() << "createFastPixmap";
        createFastScaledPixmap();
    }
    else {
        //qDebug() << "createPixmap";
        createPixmap();
        update();
    }
}
void MainWidget::setXmlHeight(int xmlHeight) {
    m_xmlHeight = xmlHeight;
}
void MainWidget::setXmlWidth(int xmlWidth) {
    m_xmlWidth = xmlWidth;
    emit xmlWidthChanged();
}
void MainWidget::setPaintEnabled(bool paintEnabled) {
    if (m_paintEnabled == paintEnabled)
        return;
    m_paintEnabled = paintEnabled;
    emit paintEnabledChanged();
    createPixmap();
    update();
}
void MainWidget::setShowRoute(bool showRoute) {
    /*if ((m_showRoute == false)&&(showRoute == true)) {
        createFastRoutePixmap();
    }*/
    m_showRoute = showRoute;
    createPixmap();
    update();
}
void MainWidget::setFirstScale(qreal firstScale) {
    m_firstScale = firstScale;
}

/*void MainWidget::scaleChanged() {

}*/





