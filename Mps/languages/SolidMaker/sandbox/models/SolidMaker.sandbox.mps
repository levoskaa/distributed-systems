<?xml version="1.0" encoding="UTF-8"?>
<model ref="r:0b67f2e0-d85c-442e-930d-13f8a0d8f8bf(SolidMaker.sandbox)">
  <persistence version="9" />
  <languages>
    <use id="f20fa6ad-2c4f-467e-ac88-00277ef9754a" name="SolidMaker" version="0" />
  </languages>
  <imports />
  <registry>
    <language id="f20fa6ad-2c4f-467e-ac88-00277ef9754a" name="SolidMaker">
      <concept id="4851752937634907702" name="SolidMaker.structure.Sphere" flags="ng" index="iYMmx">
        <property id="4851752937634907703" name="radius" index="iYMmw" />
      </concept>
      <concept id="4851752937634907705" name="SolidMaker.structure.Scene" flags="ng" index="iYMmI">
        <child id="4851752937634907708" name="shapes" index="iYMmF" />
      </concept>
      <concept id="4851752937634907692" name="SolidMaker.structure.Shape" flags="ng" index="iYMmV">
        <property id="4851752937634907698" name="z" index="iYMm_" />
        <property id="4851752937634907695" name="y" index="iYMmS" />
        <property id="4851752937634907693" name="x" index="iYMmU" />
      </concept>
    </language>
    <language id="ceab5195-25ea-4f22-9b92-103b95ca8c0c" name="jetbrains.mps.lang.core">
      <concept id="1169194658468" name="jetbrains.mps.lang.core.structure.INamedConcept" flags="ng" index="TrEIO">
        <property id="1169194664001" name="name" index="TrG5h" />
      </concept>
    </language>
  </registry>
  <node concept="iYMmI" id="4dkSTthFWOi">
    <property role="TrG5h" value="MyScene" />
    <node concept="iYMmx" id="4dkSTthFX50" role="iYMmF">
      <property role="iYMmw" value="6" />
      <property role="iYMmU" value="0" />
      <property role="iYMmS" value="0" />
      <property role="iYMm_" value="0" />
    </node>
    <node concept="iYMmx" id="4dkSTthFX55" role="iYMmF">
      <property role="iYMmw" value="5" />
      <property role="iYMmU" value="22" />
      <property role="iYMmS" value="22" />
      <property role="iYMm_" value="22" />
    </node>
  </node>
</model>

