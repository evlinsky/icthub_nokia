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
    Q_PROPERTY(QVariantList rects READ rects WRITE setRects)
    Q_PROPERTY(QVariantList routeStations READ routeStations WRITE setRouteStations)
    Q_PROPERTY(QVariantList routeEdges READ routeEdges WRITE setRouteEdges)
    Q_PROPERTY(int parentWidth READ parentWidth WRITE setParentWidth NOTIFY parentWidthChanged)
    Q_PROPERTY(int parentHeight READ parentHeight WRITE setParentHeight)
    Q_PROPERTY(int penWidth READ penWidth WRITE setPenWidth)
    Q_PROPERTY(int circleSize READ circleSize WRITE setCircleSize)
    Q_PROPERTY(bool paintEnabled READ paintEnabled WRITE setPaintEnabled NOTIFY paintEnabledChanged)
    Q_PROPERTY(bool showRoute READ showRoute WRITE setShowRoute)
    Q_PROPERTY(bool repaint READ repaint WRITE setRepaint NOTIFY repaintChanged)
    Q_PROPERTY(bool fast READ fast WRITE setFast)
    Q_PROPERTY(qreal firstScale READ firstScale WRITE setFirstScale)



public:
    MainWidget(QDeclarativeItem *parent = 0);
    void paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget);
    QRectF boundingRect () const;

    // Get methods
    int x() const { return m_x; }
    int y() const { return m_y; }
    int width() const { return m_width; }
    int height() const { return m_height; }
    int xmlWidth() const { return m_xmlWidth; }
    int xmlHeight() const { return m_xmlHeight; }
    QVariantList allEdges() const { return m_allEdges; }
    QVariantList allStations() const { return m_allStations; }
    QVariantList rects() const {return m_rects; }
    QVariantList routeStations() const {return m_routeStations;}
    QVariantList routeEdges() const {return m_routeEdges;}
    int parentWidth() const { return m_parentWidth; }
    int parentHeight() const { return m_parentHeight; }
    int penWidth() const { return m_penWidth; }
    int circleSize() const { return m_cirlceSize; }
    qreal opacity() const { return m_opacity; }
    double scale() const { return m_scale; }
    bool paintEnabled() const {return m_paintEnabled;}
    bool showRoute() const {return m_showRoute;}
    bool repaint() const {return m_repaint;}
    bool fast() const {return m_fast;}
    bool firstScale() const {return m_firstScale;}
    Q_INVOKABLE double getCoef(){return ((double)m_parentWidth * m_scale / m_xmlWidth);}

    // Set methods
    void setX(int x);
    void setY(int y);
    void setWidth(int width);
    void setHeight(int height);
    void setXmlWidth(int xmlWidth);
    void setXmlHeight(int xmlHeight);
    void setAllEdges(QVariantList allEdges);
    void setAllStations(QVariantList allStations);
    void setRects(QVariantList rects);
    void setRouteStations(QVariantList routeStations);
    void setRouteEdges(QVariantList routeEdges);
    void setParentWidth(int parentWidth);
    void setParentHeight(int parentHeight);
    void setPenWidth(int newWidth);
    void setOpacity(qreal newOpacity);
    void setCircleSize(int newSize);
    void setScale(double newScale);
    void setPaintEnabled(bool paintEnabled);
    void setShowRoute(bool showRoute);
    void setRepaint(bool repaint);
    void setFast(bool fast);
    void setFirstScale(qreal firstScale);



signals:
    void xChanged();
    void yChanged();
    void widthChanged();
    void heightChanged();
    void scaleChanged();
    void opacityChanged();
    void xmlWidthChanged();
    void parentWidthChanged();
    void paintEnabledChanged();
    void repaintChanged();

protected:
    void updateSize() {
        /*setX(qMin(m_x1, m_x2) - m_penWidth/2);
        setY(qMin(m_y1, m_y2) - m_penWidth/2);
        setWidth(qAbs(m_x2 - m_x1) + m_penWidth);
        setHeight(qAbs(m_y2 - m_y1) + m_penWidth);*/
    }
    void createPixmap();
    Q_INVOKABLE void createFastRoutePixmap();
    Q_INVOKABLE void createFastScaledPixmap();
    void createFastPixmap();

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
    double m_scale;
    double m_newScale;
    double m_coef;
    qreal m_opacity;
    QVariantList m_allEdges;
    QVariantList m_allStations;
    QVariantList m_rects;
    QVariantList m_routeStations;
    QVariantList m_routeEdges;
    bool m_paintEnabled;
    QPixmap* m_pixmap;
    QPixmap* m_oldPixmap;
    QPixmap* m_smallPixmap;
    double m_oldScale;
    bool init;
    bool m_showRoute;
    bool m_repaint;
    bool m_fast;
    bool m_oldFast;
    qreal m_firstScale;
    int oldX, oldY;

    QPainter* m_painter;
    QWidget* m_widget;
    QStyleOptionGraphicsItem* m_option;
};

QML_DECLARE_TYPE(MainWidget)


#endif // MAINWIDGET_H
