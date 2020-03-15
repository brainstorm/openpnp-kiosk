# Balena.io OpenPnP application

To build locally before pushing to Balena cloud:

```bash
docker buildx build --platform linux/arm64 .
```

## TODO

```
14.03.20 23:50:09 (+0000)  main  javassist.NotFoundException: org.jdesktop.beansbinding.ELProperty
14.03.20 23:50:09 (+0000)  main         at javassist.ClassPool.get(ClassPool.java:436)
14.03.20 23:50:09 (+0000)  main         at org.openpnp.Main.monkeyPatchBeansBinding(Main.java:89)
14.03.20 23:50:09 (+0000)  main         at org.openpnp.Main.main(Main.java:117)
14.03.20 23:50:15 (+0000)  main  2020-03-14 23:50:15.826 SystemLogger ERROR: Mar 14, 2020 11:50:15 PM java.util.prefs.FileSystemPreferences$1 run
14.03.20 23:50:15 (+0000)  main  INFO: Created user preferences directory.
14.03.20 23:50:36 (+0000)  main  2020-03-14 23:50:36.685 Configuration INFO: No packages.xml found in configuration directory, loading defaults.
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.216 Configuration INFO: No parts.xml found in configuration directory, loading defaults.
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.683 SystemLogger ERROR: java.lang.Exception: Error while reading machine.xml (null)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.687 SystemLogger ERROR:     at org.openpnp.model.Configuration.load(Configuration.java:287)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.690 SystemLogger ERROR:     at org.openpnp.gui.MainFrame.<init>(MainFrame.java:641)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.692 SystemLogger ERROR:     at org.openpnp.Main$1.run(Main.java:152)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.696 SystemLogger ERROR:     at java.desktop/java.awt.event.InvocationEvent.dispatch(InvocationEvent.java:313)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.699 SystemLogger ERROR:     at java.desktop/java.awt.EventQueue.dispatchEventImpl(EventQueue.java:770)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.703 SystemLogger ERROR:     at java.desktop/java.awt.EventQueue$4.run(EventQueue.java:721)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.707 SystemLogger ERROR:     at java.desktop/java.awt.EventQueue$4.run(EventQueue.java:715)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.710 SystemLogger ERROR:     at java.base/java.security.AccessController.doPrivileged(Native Method)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.715 SystemLogger ERROR:     at java.base/java.security.ProtectionDomain$JavaSecurityAccessImpl.doIntersectionPrivilege(ProtectionDomain.java:85)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.718 SystemLogger ERROR:     at java.desktop/java.awt.EventQueue.dispatchEvent(EventQueue.java:740)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.723 SystemLogger ERROR:     at java.desktop/java.awt.EventDispatchThread.pumpOneEventForFilters(EventDispatchThread.java:203)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.727 SystemLogger ERROR:     at java.desktop/java.awt.EventDispatchThread.pumpEventsForFilter(EventDispatchThread.java:124)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.732 SystemLogger ERROR:     at java.desktop/java.awt.EventDispatchThread.pumpEventsForHierarchy(EventDispatchThread.java:113)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.736 SystemLogger ERROR:     at java.desktop/java.awt.EventDispatchThread.pumpEvents(EventDispatchThread.java:109)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.741 SystemLogger ERROR:     at java.desktop/java.awt.EventDispatchThread.pumpEvents(EventDispatchThread.java:101)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.745 SystemLogger ERROR:     at java.desktop/java.awt.EventDispatchThread.run(EventDispatchThread.java:90)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.750 SystemLogger ERROR: Caused by: java.lang.reflect.InvocationTargetException
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.754 SystemLogger ERROR:     at java.base/jdk.internal.reflect.NativeConstructorAccessorImpl.newInstance0(Native Method)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.758 SystemLogger ERROR:     at java.base/jdk.internal.reflect.NativeConstructorAccessorImpl.newInstance(NativeConstructorAccessorImpl.java:62)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.762 SystemLogger ERROR:     at java.base/jdk.internal.reflect.DelegatingConstructorAccessorImpl.newInstance(DelegatingConstructorAccessorImpl.java:45)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.767 SystemLogger ERROR:     at java.base/java.lang.reflect.Constructor.newInstance(Constructor.java:490)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.773 SystemLogger ERROR:     at org.simpleframework.xml.core.InstanceFactory.getObject(InstanceFactory.java:100)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.783 SystemLogger ERROR:     at org.simpleframework.xml.core.InstanceFactory$ClassInstance.getInstance(InstanceFactory.java:233)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.790 SystemLogger ERROR:     at org.simpleframework.xml.core.ObjectInstance.getInstance(ObjectInstance.java:95)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.796 SystemLogger ERROR:     at org.simpleframework.xml.core.ObjectInstance.getInstance(ObjectInstance.java:76)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.802 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite$Builder.read(Composite.java:1376)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.807 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.read(Composite.java:201)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.812 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.read(Composite.java:148)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.817 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.readVariable(Composite.java:623)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.823 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.readInstance(Composite.java:573)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.828 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.readUnion(Composite.java:549)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.833 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.readElement(Composite.java:532)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.838 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.readElements(Composite.java:445)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.842 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.access$400(Composite.java:59)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.847 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite$Builder.read(Composite.java:1383)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.852 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.read(Composite.java:201)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.857 SystemLogger ERROR:     at org.simpleframework.xml.core.Composite.read(Composite.java:148)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.862 SystemLogger ERROR:     at org.simpleframework.xml.core.Traverser.read(Traverser.java:92)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.867 SystemLogger ERROR:     at org.simpleframework.xml.core.Persister.read(Persister.java:625)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.873 SystemLogger ERROR:     at org.simpleframework.xml.core.Persister.read(Persister.java:606)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.878 SystemLogger ERROR:     at org.simpleframework.xml.core.Persister.read(Persister.java:584)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.884 SystemLogger ERROR:     at org.simpleframework.xml.core.Persister.read(Persister.java:543)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.889 SystemLogger ERROR:     at org.simpleframework.xml.core.Persister.read(Persister.java:521)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.895 SystemLogger ERROR:     at org.simpleframework.xml.core.Persister.read(Persister.java:426)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.900 SystemLogger ERROR:     at org.openpnp.model.Configuration.loadMachine(Configuration.java:416)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.904 SystemLogger ERROR:     at org.openpnp.model.Configuration.load(Configuration.java:280)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.909 SystemLogger ERROR:     ... 15 more
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.916 SystemLogger ERROR: Caused by: java.lang.ExceptionInInitializerError
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.921 SystemLogger ERROR:     at nu.pattern.OpenCV$SharedLoader.getInstance(OpenCV.java:232)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.930 SystemLogger ERROR:     at nu.pattern.OpenCV.loadShared(OpenCV.java:181)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.935 SystemLogger ERROR:     at org.openpnp.vision.pipeline.CvPipeline.<clinit>(CvPipeline.java:49)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.940 SystemLogger ERROR:     at org.openpnp.machine.reference.vision.ReferenceFiducialLocator.createDefaultPipeline(ReferenceFiducialLocator.java:481)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.945 SystemLogger ERROR:     at org.openpnp.machine.reference.vision.ReferenceFiducialLocator.<init>(ReferenceFiducialLocator.java:59)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.949 SystemLogger ERROR:     at org.openpnp.machine.reference.ReferenceMachine.<init>(ReferenceMachine.java:86)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.954 SystemLogger ERROR:     ... 44 more
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.960 SystemLogger ERROR: Caused by: java.lang.UnsupportedOperationException: Architecture "aarch64" is not supported.
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.966 SystemLogger ERROR:     at nu.pattern.OpenCV$Arch.getCurrent(OpenCV.java:91)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.972 SystemLogger ERROR:     at nu.pattern.OpenCV.extractNativeBinary(OpenCV.java:316)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.978 SystemLogger ERROR:     at nu.pattern.OpenCV.access$100(OpenCV.java:22)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.984 SystemLogger ERROR:     at nu.pattern.OpenCV$SharedLoader.<init>(OpenCV.java:204)
14.03.20 23:50:38 (+0000)  main  2020-03-14 23:50:38.990 SystemLogger ERROR:     at nu.pattern.OpenCV$SharedLoader.<init>(OpenCV.java:187)
14.03.20 23:50:39 (+0000)  main  2020-03-14 23:50:38.996 SystemLogger ERROR:     at nu.pattern.OpenCV$SharedLoader$Holder.<clinit>(OpenCV.java:228)
14.03.20 23:50:39 (+0000)  main  2020-03-14 23:50:39.001 SystemLogger ERROR:     ... 50 more
```
