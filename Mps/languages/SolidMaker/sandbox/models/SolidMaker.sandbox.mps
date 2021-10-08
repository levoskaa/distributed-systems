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
        <child id="3187011881833199046" name="shapes" index="3FDRYH" />
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
  <node concept="iYMmI" id="31nr4L6mDLc">
    <property role="TrG5h" value="MyScene" />
    <node concept="iYMmx" id="31nr4L6mDLf" role="3FDRYH">
      <property role="iYMmU" value="50" />
      <property role="iYMmS" value="50" />
      <property role="iYMm_" value="0" />
      <property role="iYMmw" value="10" />
    </node>
    <node concept="iYMmx" id="31nr4L6mDLl" role="3FDRYH">
      <property role="iYMmU" value="200" />
      <property role="iYMmS" value="200" />
      <property role="iYMm_" value="0" />
      <property role="iYMmw" value="40" />
    </node>
    <node concept="iYMmx" id="31nr4L6mDLt" role="3FDRYH">
      <property role="iYMmU" value="350" />
      <property role="iYMmS" value="350" />
      <property role="iYMm_" value="0" />
      <property role="iYMmw" value="90" />
    </node>
  </node>
</model>

