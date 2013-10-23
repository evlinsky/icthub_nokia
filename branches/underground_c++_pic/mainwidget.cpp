#include <QDeclarativeItem>
#include <QPainter>
#include <QFont>
#include <QPointF>
#include "apptypes.h"
#include "appdata.h"
#include "mainwidget.h"

MainWidget::MainWidget(QDeclarativeItem *parent) :
    QDeclarativeItem(parent), m_x(0), m_y(0), m_width(0), m_height(0)
{
    // Important, otherwise the paint method is never called
    setFlag(QGraphicsItem::ItemHasNoContents, false);
    setFlag(QGraphicsItem::ItemIsMovable, true);
    m_opacity = 1;
    m_paintEnabled = false;
    //update();
    //setCacheMode(QGraphicsItem::);
    //setBaselineOffset(-1000);
}

void MainWidget::createPixmap() {
    if (!m_paintEnabled)
        return;
    if (m_loadedImage != m_imageUrl) {
        m_loadedImage = m_imageUrl;
        m_originalImage = new QImage(m_imageUrl);
    }
    if (m_loadedImage == "")
        return;

    double coef = (double)m_parentWidth * m_scale / m_xmlWidth;
    setWidth(m_xmlWidth * coef);
    setHeight(m_xmlHeight * coef);

    qDebug() << m_width;

    m_pixmap = new QPixmap(m_width, m_height);
    QPainter* painter = new QPainter(m_pixmap);
    painter->fillRect(m_pixmap->rect(), Qt::white);
    painter->setRenderHint(QPainter::Antialiasing);

    m_image = m_originalImage->scaled(m_width, m_height,Qt::IgnoreAspectRatio, Qt::SmoothTransformation);
    painter->drawImage(m_pixmap->rect(), m_image, m_image.rect());
}

void MainWidget::paint(QPainter *painter, const QStyleOptionGraphicsItem *option, QWidget *widget)
{
    if (!m_paintEnabled)
        return;
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
    if (m_loadedImage != "")
        painter->drawPixmap(curRect, *m_pixmap, curRect);
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
    m_allStations = allStations;
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
void MainWidget::setScale(double newScale) {
    if(m_scale == newScale) return;
    m_scale = newScale;
    emit scaleChanged();
    createPixmap();
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
void MainWidget::setImageUrl(QString imageUrl) {
    if (m_imageUrl == imageUrl)
        return;
    m_imageUrl = imageUrl;
    createPixmap();
    update();
}

/*void MainWidget::scaleChanged() {

}*/





