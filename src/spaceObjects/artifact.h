#ifndef ARTIFACT_H
#define ARTIFACT_H

#include "spaceObject.h"

class Artifact : public SpaceObject, public Updatable
{
private:
    string model_data_name;
    float artifact_spin;
    bool allow_pickup;
    float size;
    ScriptSimpleCallback on_pickup_callback;
    int32_t orbit_target_id;
    float orbit_time;
    float orbit_distance;
    ScriptSimpleCallback on_collision_callback;
    ScriptSimpleCallback on_player_collision_callback;

    string radar_trace_icon;
    float radar_trace_scale;
    sf::Color radar_trace_color;
public:
    Artifact();
    
    string current_model_data_name;

    virtual void update(float delta) override;

    virtual void draw3D() override;

    virtual void drawOnRadar(sf::RenderTarget& window, sf::Vector2f position, float scale, float rotation, bool long_range) override;

    virtual void collide(Collisionable* target, float force) override;

    void setModel(string name);
    void setSpin(float spin=0.0);
    void explode();
    void allowPickup(bool allow);
    void setOrbit(P<SpaceObject> target, float orbit_time);
    void setOrbitDistance(float orbit_distance);
    void setHull(float hull) {this->hull = hull;}

    void setRadarTraceIcon(string icon);
    void setRadarTraceScale(float scale);
    void setRadarTraceColor(int r, int g, int b) { radar_trace_color = sf::Color(r, g, b); }

    void onPickUp(ScriptSimpleCallback callback);
    // Consistent naming workaround
    void onPickup(ScriptSimpleCallback callback) { onPickUp(callback); }
    void onCollision(ScriptSimpleCallback callback);
    void onPlayerCollision(ScriptSimpleCallback callback);

    virtual string getExportLine() override;

protected:
    glm::mat4 getModelMatrix() const override;
};

#endif//ARTIFACT_H
