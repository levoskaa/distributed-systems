package SolidMaker.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.runtime.BaseStructureAspectDescriptor;
import jetbrains.mps.smodel.runtime.ConceptDescriptor;
import java.util.Collection;
import java.util.Arrays;
import org.jetbrains.annotations.Nullable;
import jetbrains.mps.smodel.adapter.ids.SConceptId;
import org.jetbrains.mps.openapi.language.SAbstractConcept;
import jetbrains.mps.smodel.runtime.impl.ConceptDescriptorBuilder2;
import jetbrains.mps.smodel.adapter.ids.PrimitiveTypeId;

public class StructureAspectDescriptor extends BaseStructureAspectDescriptor {
  /*package*/ final ConceptDescriptor myConceptScene = createDescriptorForScene();
  /*package*/ final ConceptDescriptor myConceptShape = createDescriptorForShape();
  /*package*/ final ConceptDescriptor myConceptSphere = createDescriptorForSphere();
  private final LanguageConceptSwitch myIndexSwitch;

  public StructureAspectDescriptor() {
    myIndexSwitch = new LanguageConceptSwitch();
  }


  @Override
  public void reportDependencies(jetbrains.mps.smodel.runtime.StructureAspectDescriptor.Dependencies deps) {
    deps.extendedLanguage(0xceab519525ea4f22L, 0x9b92103b95ca8c0cL, "jetbrains.mps.lang.core");
  }

  @Override
  public Collection<ConceptDescriptor> getDescriptors() {
    return Arrays.asList(myConceptScene, myConceptShape, myConceptSphere);
  }

  @Override
  @Nullable
  public ConceptDescriptor getDescriptor(SConceptId id) {
    switch (myIndexSwitch.index(id)) {
      case LanguageConceptSwitch.Scene:
        return myConceptScene;
      case LanguageConceptSwitch.Shape:
        return myConceptShape;
      case LanguageConceptSwitch.Sphere:
        return myConceptSphere;
      default:
        return null;
    }
  }


  /*package*/ int internalIndex(SAbstractConcept c) {
    return myIndexSwitch.index(c);
  }

  private static ConceptDescriptor createDescriptorForScene() {
    ConceptDescriptorBuilder2 b = new ConceptDescriptorBuilder2("SolidMaker", "Scene", 0xf20fa6ad2c4f467eL, 0xac8800277ef9754aL, 0x4354e39751afc639L);
    b.class_(false, false, true);
    b.parent(0xceab519525ea4f22L, 0x9b92103b95ca8c0cL, 0x110396eaaa4L);
    b.parent(0x4caf0310491e41f5L, 0x8a9b2006b3a94898L, 0x40c1a7cb987d20d5L);
    b.origin("r:743558e1-4fb8-4853-93b0-8bd9f0ca762b(SolidMaker.structure)/4851752937634907705");
    b.version(2);
    b.aggregate("shapes", 0x2c3a8a6bc79df5c6L).target(0xf20fa6ad2c4f467eL, 0xac8800277ef9754aL, 0x4354e39751afc62cL).optional(true).ordered(true).multiple(true).origin("3187011881833199046").done();
    b.alias("scene");
    return b.create();
  }
  private static ConceptDescriptor createDescriptorForShape() {
    ConceptDescriptorBuilder2 b = new ConceptDescriptorBuilder2("SolidMaker", "Shape", 0xf20fa6ad2c4f467eL, 0xac8800277ef9754aL, 0x4354e39751afc62cL);
    b.class_(false, true, false);
    b.origin("r:743558e1-4fb8-4853-93b0-8bd9f0ca762b(SolidMaker.structure)/4851752937634907692");
    b.version(2);
    b.property("x", 0x4354e39751afc62dL).type(PrimitiveTypeId.INTEGER).origin("4851752937634907693").done();
    b.property("y", 0x4354e39751afc62fL).type(PrimitiveTypeId.INTEGER).origin("4851752937634907695").done();
    b.property("z", 0x4354e39751afc632L).type(PrimitiveTypeId.INTEGER).origin("4851752937634907698").done();
    return b.create();
  }
  private static ConceptDescriptor createDescriptorForSphere() {
    ConceptDescriptorBuilder2 b = new ConceptDescriptorBuilder2("SolidMaker", "Sphere", 0xf20fa6ad2c4f467eL, 0xac8800277ef9754aL, 0x4354e39751afc636L);
    b.class_(false, false, false);
    b.super_("SolidMaker.structure.Shape", 0xf20fa6ad2c4f467eL, 0xac8800277ef9754aL, 0x4354e39751afc62cL);
    b.origin("r:743558e1-4fb8-4853-93b0-8bd9f0ca762b(SolidMaker.structure)/4851752937634907702");
    b.version(2);
    b.property("radius", 0x4354e39751afc637L).type(PrimitiveTypeId.INTEGER).origin("4851752937634907703").done();
    b.alias("sphere");
    return b.create();
  }
}
